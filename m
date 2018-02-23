From: Trent Piepho <tpiepho@impinj.com>
Date: Fri, 23 Feb 2018 18:25:38 +0000
Subject: [Buildroot] [PATCH] package/skeleton-init-systemd: create a
 symlink /var/run to ../run
In-Reply-To: <20180222221014.19584-1-romain.naour@gmail.com>
References: <20180222221014.19584-1-romain.naour@gmail.com>
Message-ID: <1519410337.25567.173.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2018-02-22 at 23:10 +0100, Romain Naour wrote:
> As reported by J?r?my Rosen [1] and Jan Kundr?t (RO case)[2], systemd
> looks for the dbus socket in /run/dbus instead of /var/run/dbus which
> is not where dbus puts the socket. This is a change introduced with
> the last version bump v237 [3].
> 
> The file /usr/lib/tmpfiles.d/var.con will create automatically that
> symlink at bootup /var/run doesn't exist yet. But dbus creates, at
> install time, the directory /var/run/dbus without taking care of
> /var/run. So we end up with two different directories /run and
> /var/run. This bug affects more or less all systemd-provided
> utilities, including logind and systemd itself.
> 
> This patch create the correct symlink run -> ../run when systemd
> is used as init system.

This doesn't work in the RO root case.  I described this in another
mail to the list, but in the RO root case target/var is a symlink to
target/usr/share/factory/var.  Thus this link is actually created as:

target/usr/share/factory/var/run -> ../run

It points to target/usr/share/factory/run, which is wrong.  In order to
get it to work in the RO case, instead create this link.

define SKELETON_INIT_SYSTEMD_VAR_RUN_LINK
       ln -sf ../../../../run $(TARGET_DIR)/usr/share/factory/var/run
endef
 
SKELETON_INIT_SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
       SKELETON_INIT_SYSTEMD_VAR_RUN_LINK

Then you get a target that looks like this:
                                                                 
lrwxrwxrwx    1 root     root  29 Feb 23 02:35 /var/run -> ../usr/share/factory//var/run
lrwxrwxrwx    1 root     root  15 Feb 23 00:51 /usr/share/factory/var/run -> ../../../../run

On the target, /var/run ends up pointing to /run and also on the host
$TARGET_DIR/var/run points to $TARGET_DIR/run.
