From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 15 May 2009 02:11:23 -0300
Subject: [Buildroot] [PATCH] Fix avahi build
In-Reply-To: <877i0jr9i2.fsf@macbook.be.48ers.dk>
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
	<877i0jr9i2.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730905142211u73224c09p6202e672f303cd45@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, May 14, 2009 at 12:26 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "root" == root ?<thiago.correa@gmail.com> writes:
>
> ?root> Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
> ?root> ---
> ?root> ?package/avahi/avahi.mk | ? ?1 +
> ?root> ?1 files changed, 1 insertions(+), 0 deletions(-)
>
> ?root> +++ b/package/avahi/avahi.mk
> ?root> @@ -150,6 +150,7 @@ ifeq ($(BR2_PACKAGE_AVAHI_AUTOIPD),y)
> ?root> ? ? ? ? ?$(INSTALL) -D -m 0755 package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
> ?root> ? ? ? ? ?$(INSTALL) -m 0755 package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
> ?root> ? ? ? ? ?rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
> ?root> + ? ? ? ?mkdir -p $(TARGET_DIR)/var/lib/
>
> What exactly does this fix? It seems like we should have /var/lib/ as
> we're removing /var/lib/avahi-autoipd?
>
> A bit more detailed description in your commit message would be good.

Perhaps the order of packages influenced it once that it built onetime
for whoever wrote that.
The line below that is:
ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd

make atngw100-extended_defconfig && make
and it will fail there, because the folder $(TARGET_DIR)/var/lib/ doesn't exist.
Apply patch then rm -rf binaries build_* toolchain_* project_* && make
and it all goes well. That's the actual test procedure I did. I try to
test most commits with a clean build to make sure I'm not screwing
things up.

I found the problem testing the atngw100*_defconfig's from the other patches.

Kind Regards,
    Thiago A. Correa
