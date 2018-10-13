From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Oct 2018 17:41:22 +0200
Subject: [Buildroot] UEFI and systemD
In-Reply-To: <ea-mime-5bc05f19-57c-2be43419@www-5.netcourrier.com>
References: <ea-mime-5bc05f19-57c-2be43419@www-5.netcourrier.com>
Message-ID: <b6f1c151-f6ce-1436-01e1-757ac2e6aa7f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/10/18 10:45, lpdev at cordier.org wrote:
> Hi everybody,
> 
> I finally succeed to compile and start a linux kernel using EFI. My kernel is
> booting, but it seems that systemd is not starting. (I only get output from the
> kernel, and when I plugin/plugoff devices). I have no tty for interacting with
> the operating system.
> 
> After digging in systemd.mk, I noticed that in SYSTEMD_CONF_OPTS, 2 options are
> disabled:
> 
> ??? -Defi=false \
> ??? -Dgnu-efi=false \
> 
> Is it normal? Any clue to how to make systemd boot while using Uefi?

 Try setting those options to true and see if it helps...

 The -Defi=false option has been there since the option was introduced in the
bump from 44 to 207. Probably just not something considered relevant at the time.

 The -Dgnu-efi=false was introduced in ac0a31090ad44531fd14a3e3b1bb7e23c1577f68
with the following explanation:

    - Add --disable-gnuefi to configure options to avoid a failure like this
      one:

      checking for /usr/lib/gnuefi/elf_ia32_efi.lds... configure: error:
      cannot check for file existence when cross compiling

 With the switch to meson, that's probably not relevant anymore and it should
instead become something like this:

ifeq ($(BR2_PACKAGE_GNU_EFI),y)
SYSTEMD_DEPENDENCIES += gnu-efi
SYSTEMD_CONF_OPTS += -Dgnu-efi=true
else
SYSTEMD_CONF_OPTS += -Dgnu-efi=false
endif


 If you do get success with these changes, could you send two patches to
Buildroot? The first one to enable the optional gnu-efi dependency, the second
one to enable efi when appropriate. For the latter, of course, you should first
find out when it is appropriate to enable efi.


 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
