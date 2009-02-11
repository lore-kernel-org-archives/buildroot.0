From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 11 Feb 2009 21:03:31 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <d6cda7730902101048w1706b7e9j41d8702d50766756@mail.gmail.com>
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<87hc3376b4.fsf@macbook.be.48ers.dk>
	<1234219930.4143.16.camel@elrond.atmel.com>
	<874oz27iry.fsf@macbook.be.48ers.dk>
	<078a01c98b68$c18b47c0$f53018ac@Glamdring>
	<87ab8u5ub5.fsf@macbook.be.48ers.dk>
	<083a01c98b86$99d10260$f53018ac@Glamdring>
	<d6cda7730902100834j409c7df8te83d42356957608c@mail.gmail.com>
	<d6cda7730902100917o3aee167fg2ae06ca5e3e402ba@mail.gmail.com>
	<08b701c98ba7$906b24f0$f53018ac@Glamdring>
	<d6cda7730902101048w1706b7e9j41d8702d50766756@mail.gmail.com>
Message-ID: <1234382611.22044.8.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-02-10 klockan 16:48 -0200 skrev Thiago A. Corr?a:
> Hi,
> 
> On Tue, Feb 10, 2009 at 3:42 PM, Ulf Samuelsson
> <ulf.samuelsson@atmel.com> wrote:
> > No you have totally misunderstood.
> > U-Boot will, with my patch use an initial default, but you can
> > update the linux kernel version and then automatically generate the kernel
> > name for tftp download without recompiling u-boot.
> >
> > That is why you have the os command.
> >
> > A better implementation would automatically
> > recompute the linux kernel name when any
> > part of it is changed.
> >
> 
> But you never update kernel-date env variable. That way it can't guess
> what to concatenate in there, or it will always generate the same
> name.


The user can do thinks like:

setenv kernel-date 20090123 ; os
setenv kernel-version 2.6.28.1; os

to tell u-boot that a new version is to be used.



--------------------------

Just for fun, I checked my OpenSuSE /boot directory

Guess what I found:

"vmlinuz" which happens to be a LINK to

??vmlinuz-$(KERNEL_VERSION)-$(REV)-$PROJECT)
?
There was also a:
vmlinux-$(KERNEL_VERSION)-$(REV)-$PROJECT).gz file

Looks like the guys doing OpenSuSE are as "odd" as I am.

Would be interesting to know how the /boot directory
in Fedora, Ubuntu etc look like.

BR
Ulf Samuelsson



> 
> One possible way could be:
> +int do_os (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
> +{
> +       char kname[512];
> +       char *curname;
> +       char *kdate;
> +       int datepos;
> +       curname = getenv("linux");
> +       kdate = getenv("kernel-date");
> +       datepos = strstr(curname, kdate);
> +       if (datepos) {
> +               //Replace the hardcoded date
> +               curname[datepos] = 0;
> +               sprintf(kname, "%s%s%s", curname, date??, curname +
> datepos + strlen(kdate));
> +       } else {
> +               strcpy(kname, "uImage");
> +       }
> +       setenv("linux", kname);
> +       return 0;
> +}
> 
> This searches the kernel-date inside the name, therefore it can be
> anywhere, and updates it. But as you can see from date??? I have no
> idea where the new value comes from.
> If it comes from some script or program, it could be modified so that
> it stores the older date in kernel-olddate variable, then you searcho
> for it and replace with the new date:
> 
> +int do_os (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
> +{
> +       char kname[512];
> +       char *curname;
> +       char *kdate;
> +       int datepos;
> +       curname = getenv("linux");
> +       kdate = getenv("kernel-olddate");
> +       datepos = strstr(curname, kdate);
> +       if (datepos) {
> +               //Replace the hardcoded date
> +               curname[datepos] = 0;
> +               sprintf(kname, "%s%s%s", curname,
> getenv("kernel-date"), curname + datepos + strlen(kdate));
> +       } else {
> +               strcpy(kname, "uImage");
> +       }
> +       setenv("linux", kname);
> +       return 0;
> +}
> 
> 
> Regards,
>    Thiago A. Correa
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
