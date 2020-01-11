From: Markus Mayer <mmayer@broadcom.com>
Date: Sat, 11 Jan 2020 09:59:16 -0800
Subject: [Buildroot] Kconfig warnings with GCC9
In-Reply-To: <87a76ujsuv.fsf@dell.be.48ers.dk>
References: <CAGt4E5su1GkK+5ghxC9x9G9KNizC-5jm5E58qPKkDXKuDu5CqQ@mail.gmail.com>
 <20200110215652.291df299@windsurf>
 <CAGt4E5u+KA3Vi0dp+YRAYnvXSJN1XXF=S86Th4NoyamnQSWpiw@mail.gmail.com>
 <87a76ujsuv.fsf@dell.be.48ers.dk>
Message-ID: <CAGt4E5s9k2ypwQ5MXBpQA=Wf_W8SMN4u_DvXJtDeJeR0-9H0Eg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jan 2020 at 00:32, Peter Korsgaard <peter@korsgaard.com> wrote:
>  > On Fri, 10 Jan 2020 at 12:56, Thomas Petazzoni
>  > <thomas.petazzoni@bootlin.com> wrote:
>  >>
>  >> Hello,
>  >>
>  >> On Fri, 10 Jan 2020 11:17:47 -0800
>  >> Markus Mayer <mmayer@broadcom.com> wrote:
>  >>
>  >> > Hi all,
>  >> >
>  >> > Using GCC9 (Ubuntu 19.10), I am getting some compiler warnings
>  >> > (potential buffer overruns) in the Kconfig code. Is this a known
>  >> > issue?
>  >>
>  >> You can try to update the kconfig code in Buildroot with the kconfig
>  >> code available from the latest kernel, and see if it fixes the
>  >> warnings. We're currently using the kconfig code from 4.17-rc2 it seems.
>
>  > I'll give it a shot.
>
> Before doing that, try running make menuconfig with a recent Linux
> kernel to check if those warnings are no longer triggered.

That's kernel 5.4. Kconfig itself complains about a few Kconfig values
for my stock kernel (maybe because that's 5.3?), but the compiler is
fine. So we should be good.

$ make menuconfig
  HOSTCC  scripts/basic/fixdep
  UPD     scripts/kconfig/mconf-cfg
  HOSTCC  scripts/kconfig/mconf.o
  HOSTCC  scripts/kconfig/lxdialog/checklist.o
  HOSTCC  scripts/kconfig/lxdialog/inputbox.o
  HOSTCC  scripts/kconfig/lxdialog/menubox.o
  HOSTCC  scripts/kconfig/lxdialog/textbox.o
  HOSTCC  scripts/kconfig/lxdialog/util.o
  HOSTCC  scripts/kconfig/lxdialog/yesno.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/mconf
scripts/kconfig/mconf  Kconfig
#
# using defaults found in /boot/config-5.3.0-26-generic
#
/boot/config-5.3.0-26-generic:8195:warning: symbol value 'm' invalid for ASHMEM
/boot/config-5.3.0-26-generic:8460:warning: symbol value 'm' invalid
for REMOTEPROC
/boot/config-5.3.0-26-generic:9141:warning: symbol value 'm' invalid
for ANDROID_BINDER_IPC
/boot/config-5.3.0-26-generic:9142:warning: symbol value 'm' invalid
for ANDROID_BINDERFS

Also, comparing the config sources, there are changes like these,
which remove the code that produces the warnings.

$ diff -u br-current/support/kconfig/confdata.c linux/scripts/kconfig/confdata.c
[...]
-       sprintf(buf, "%s.tmpconfig", dir);
-       out = fopen(buf, "w");
+       out = fopen(".tmpconfig", "w");
        if (!out)
                return 1;

-       sprintf(buf, "%s.tmpconfig_tristate", dir);
-       tristate = fopen(buf, "w");
+       tristate = fopen(".tmpconfig_tristate", "w");
        if (!tristate) {
                fclose(out);
                return 1;
        }

-       sprintf(buf, "%s.tmpconfig.h", dir);
-       out_h = fopen(buf, "w");
+       out_h = fopen(".tmpconfig.h", "w");
        if (!out_h) {
                fclose(out);
                fclose(tristate);
[...]

Regards,
-Markus
