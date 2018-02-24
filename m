From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Feb 2018 19:15:49 +0100
Subject: [Buildroot] [PATCH] package/skeleton-init-systemd: create a
 symlink /var/run to ../run
In-Reply-To: <1519410337.25567.173.camel@impinj.com>
References: <20180222221014.19584-1-romain.naour@gmail.com>
 <1519410337.25567.173.camel@impinj.com>
Message-ID: <05855f3c-84ce-01b1-d86f-0394a807d01f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-02-18 19:25, Trent Piepho wrote:
> On Thu, 2018-02-22 at 23:10 +0100, Romain Naour wrote:
>> As reported by J?r?my Rosen [1] and Jan Kundr?t (RO case)[2], systemd
>> looks for the dbus socket in /run/dbus instead of /var/run/dbus which
>> is not where dbus puts the socket. This is a change introduced with
>> the last version bump v237 [3].
>>
>> The file /usr/lib/tmpfiles.d/var.con will create automatically that
>> symlink at bootup /var/run doesn't exist yet. But dbus creates, at
>> install time, the directory /var/run/dbus without taking care of
>> /var/run. So we end up with two different directories /run and
>> /var/run. This bug affects more or less all systemd-provided
>> utilities, including logind and systemd itself.
>>
>> This patch create the correct symlink run -> ../run when systemd
>> is used as init system.
> 
> This doesn't work in the RO root case.  I described this in another
> mail to the list, but in the RO root case target/var is a symlink to
> target/usr/share/factory/var.  Thus this link is actually created as:
> 
> target/usr/share/factory/var/run -> ../run
> 
> It points to target/usr/share/factory/run, which is wrong.

 Well, as such it is not wrong. What is wrong IMO is that we do:

        for i in $(TARGET_DIR)/usr/share/factory/var/*; do \
                j="$${i#$(TARGET_DIR)/usr/share/factory}"; \
                if [ -L "$${i}" ]; then \
                        printf "L+! %s - - - - %s\n" \
                                "$${j}" "../usr/share/factory/$${j}" \
                        || exit 1; \
                else \
...

 The correct thing to do would be to copy the symlink I think, so something like:

                if [ -L "$${i}" ]; then \
			target=`readlink $${i}`
                        printf "L+! %s - - - - %s\n" \
                                "$${j}" "$${target}" \
                        || exit 1; \


 However, I believe our var-factory.conf is even more wrong. systemd already
supplies /usr/lib/tmpfiles.d/var.conf for exactly this purpose. That one already
has the stanza to create the correct /var/run symlink. That var.conf is not
complete though. For example, mysql expects /var/lib/mysql to exist while
var.conf just creates /var/lib. So we do indeed need something like
var-factory.conf, but I think that it should take into account anything that is
already created by other tmpfiles configurations. So it should search each
file/directory that it finds in /usr/share/factory/var in all of the existing
tmpfiles.d entries, and if it is found there and it is not a C entry, it should
recurse.

 Well, that's my feeling, but I'm not a systemd expert :-)

 Regards,
 Arnout

>  In order to
> get it to work in the RO case, instead create this link.
> 
> define SKELETON_INIT_SYSTEMD_VAR_RUN_LINK
>        ln -sf ../../../../run $(TARGET_DIR)/usr/share/factory/var/run
> endef
>  
> SKELETON_INIT_SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>        SKELETON_INIT_SYSTEMD_VAR_RUN_LINK
> 
> Then you get a target that looks like this:
>                                                                  
> lrwxrwxrwx    1 root     root  29 Feb 23 02:35 /var/run -> ../usr/share/factory//var/run
> lrwxrwxrwx    1 root     root  15 Feb 23 00:51 /usr/share/factory/var/run -> ../../../../run
> 
> On the target, /var/run ends up pointing to /run and also on the host
> $TARGET_DIR/var/run points to $TARGET_DIR/run.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
