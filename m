From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 31 Oct 2019 14:07:08 -0300
Subject: [Buildroot] systemd: /var/tmp missing from skeleton
In-Reply-To: <ea-mime-5dbb0f86-b98-210eef42@www-2.netcourrier.com>
References: <CAJ4jsafX52oC9jO1kJ_qmqta3yyYSFOt9LcB7QJUcJ4RoeLS=g@mail.gmail.com>
 <ea-mime-5dbb0f86-b98-210eef42@www-2.netcourrier.com>
Message-ID: <CAJ4jsaccj5DTJvDXTKLE_FPr-j+kG_UXQYx=k-i7nm1PUh9gDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 31, 2019 at 1:44 PM <lpdev@cordier.org> wrote:
>
>
>
>
> De : Carlos Santos <unixmania@gmail.com>
> ? : lpdev at cordier.org
> Sujet : Re: [Buildroot] systemd: /var/tmp missing from skeleton
> Date : 30/10/2019 23:14:07 Europe/Paris
> Copie ? : buildroot <buildroot@buildroot.org>
>
> On Wed, Oct 30, 2019 at 2:45 PM <lpdev@cordier.org> wrote:
> >
> >
> > Hello,
> >
> > Just spotted an issue with the systemd package (note: I'm currently working on buildroot 2019.08.1 tag). Some services on my build are not started properly such as systemd-hostnamed.service, systemd-resolved.service and systemd-timesyncd.service.
> >
> > Some debugging unveiled that all these services are depending on /var/tmp existence (they all have the "PrivateTmp=yes" in their unit). Without this folder on the target filesystem, services will return "Failed to run 'start' task: No such file or directory".
> >
> > In order to fix that issue and submit a patch, I would like to be sure I did not miss a config in buildroot. I think the fix should take place in SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS located in package/skeleton-init-systemd.mk. Am I right?
> >
> > Thanks,
> >
>
> /var/tmp should have been created by systemd-tmpfiles on startup. Did
> you remove the systemd-tmpfiles-setup symlinks from
> /usr/lib/systemd/system/sysinit.target.wants? You can check the ststus
> with systemctl, e.g.
>
>
> Nop, systemd-tmpfiles-setup is present in /usr/lib/systemd/system/sysinit.target.wants. However, "systemctl --all | grep tmp" shows that systemd-tmpfiles-setup.service is marked as inactive and dead. Also systemctl list-dependencies does not show the tmpfiles-setup unit. Do you have any idea of where I can search to solve this problem?

What is your defconfig? Do you have BR2_PACKAGE_SYSTEMD_TMPFILES=y?

-- 
Carlos Santos <unixmania@gmail.com>
