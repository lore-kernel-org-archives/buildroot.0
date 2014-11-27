From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Thu, 27 Nov 2014 21:46:59 +0100
Subject: [Buildroot] [PATCH v2] samba: Add support for libnss_win*.so*
	installation
In-Reply-To: <20141126222607.4c57066e@free-electrons.com>
References: <1416960016-5956-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <20141126222607.4c57066e@free-electrons.com>
Message-ID: <CA+sos78dLY8ZO0oS009rQTn3LAM+ZZYGHxd0OJr-Nb1F6-=7DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Wed, Nov 26, 2014 at 10:26 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Wed, 26 Nov 2014 01:00:15 +0100, Beno?t Th?baudeau wrote:
> Applied to next. One question, though.
>
>
>> +ifeq ($(BR2_PACKAGE_SAMBA_LIBNSS_WINS),y)
>> +define SAMBA_INSTALL_LIBNSS_WINS
>> +     # install libnss_wins
>> +     $(INSTALL) -m 0755 -D $(@D)/nsswitch/libnss_wins.so $(TARGET_DIR)/lib/libnss_wins.so
>> +     ln -snf libnss_wins.so $(TARGET_DIR)/lib/libnss_wins.so.2
>
> This dance is a bit weird. Normally, it's the opposite that is done:
> the .so.X is the real file, and the .so is a symbolic link. Any reason
> to do it the way you did it?

I had noticed that EGLIBC's libnss files were organized in this
unusual way in my cross-toolchain:
/lib/libnss_<service>-<version>.so
/lib/libnss_<service>.so.<major> -> /lib/libnss_<service>-<version>.so

That's why I decided to do something similar for winbind and wins for
consistency, although these don't have a version in the library
filename.

Now that I've had a second look at it, I also see the following:
/usr/lib/libnss_<service>.so -> /lib/libnss_<service>.so.<major>

So I now think that changing my installation function to do the
opposite would be better, all the more this is also what is done on a
major OS like Ubuntu 14.10:
/lib/x86_64-linux-gnu/libnss_compat-2.19.so
/lib/x86_64-linux-gnu/libnss_compat.so.2 -> libnss_compat-2.19.so
/lib/x86_64-linux-gnu/libnss_dns-2.19.so
/lib/x86_64-linux-gnu/libnss_dns.so.2 -> libnss_dns-2.19.so
/lib/x86_64-linux-gnu/libnss_files-2.19.so
/lib/x86_64-linux-gnu/libnss_files.so.2 -> libnss_files-2.19.so
/lib/x86_64-linux-gnu/libnss_hesiod-2.19.so
/lib/x86_64-linux-gnu/libnss_hesiod.so.2 -> libnss_hesiod-2.19.so
/lib/x86_64-linux-gnu/libnss_mdns4_minimal.so.2
/lib/x86_64-linux-gnu/libnss_mdns4.so.2
/lib/x86_64-linux-gnu/libnss_mdns6_minimal.so.2
/lib/x86_64-linux-gnu/libnss_mdns6.so.2
/lib/x86_64-linux-gnu/libnss_mdns_minimal.so.2
/lib/x86_64-linux-gnu/libnss_mdns.so.2
/lib/x86_64-linux-gnu/libnss_nis-2.19.so
/lib/x86_64-linux-gnu/libnss_nisplus-2.19.so
/lib/x86_64-linux-gnu/libnss_nisplus.so.2 -> libnss_nisplus-2.19.so
/lib/x86_64-linux-gnu/libnss_nis.so.2 -> libnss_nis-2.19.so
/lib/x86_64-linux-gnu/libnss_winbind.so -> libnss_winbind.so.2
/lib/x86_64-linux-gnu/libnss_winbind.so.2
/lib/x86_64-linux-gnu/libnss_wins.so -> libnss_wins.so.2
/lib/x86_64-linux-gnu/libnss_wins.so.2
/usr/lib/debug/lib/x86_64-linux-gnu/libnss_compat-2.19.so
/usr/lib/debug/lib/x86_64-linux-gnu/libnss_dns-2.19.so
/usr/lib/debug/lib/x86_64-linux-gnu/libnss_files-2.19.so
/usr/lib/debug/lib/x86_64-linux-gnu/libnss_hesiod-2.19.so
/usr/lib/debug/lib/x86_64-linux-gnu/libnss_nis-2.19.so
/usr/lib/debug/lib/x86_64-linux-gnu/libnss_nisplus-2.19.so
/usr/lib/x86_64-linux-gnu/libnss_compat.so ->
/lib/x86_64-linux-gnu/libnss_compat.so.2
/usr/lib/x86_64-linux-gnu/libnss_dns.so -> /lib/x86_64-linux-gnu/libnss_dns.so.2
/usr/lib/x86_64-linux-gnu/libnss_files.so ->
/lib/x86_64-linux-gnu/libnss_files.so.2
/usr/lib/x86_64-linux-gnu/libnss_hesiod.so ->
/lib/x86_64-linux-gnu/libnss_hesiod.so.2
/usr/lib/x86_64-linux-gnu/libnss_nisplus.so ->
/lib/x86_64-linux-gnu/libnss_nisplus.so.2
/usr/lib/x86_64-linux-gnu/libnss_nis.so -> /lib/x86_64-linux-gnu/libnss_nis.so.2
/usr/lib/x86_64-linux-gnu/samba/libnss_info.so.0

I should send a new patch for that.

Best regards,
Beno?t
