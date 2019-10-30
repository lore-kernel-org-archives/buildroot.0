From: Carlos Santos <unixmania@gmail.com>
Date: Wed, 30 Oct 2019 19:14:07 -0300
Subject: [Buildroot] systemd: /var/tmp missing from skeleton
In-Reply-To: <ea-mime-5db9cc34-d28-2ff4d362@www-2.netcourrier.com>
References: <ea-mime-5db9cc34-d28-2ff4d362@www-2.netcourrier.com>
Message-ID: <CAJ4jsafX52oC9jO1kJ_qmqta3yyYSFOt9LcB7QJUcJ4RoeLS=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 30, 2019 at 2:45 PM <lpdev@cordier.org> wrote:
>
>
> Hello,
>
> Just spotted an issue with the systemd package (note: I'm currently working on buildroot 2019.08.1 tag). Some services on my build are not started properly such as systemd-hostnamed.service, systemd-resolved.service and systemd-timesyncd.service.
>
> Some debugging unveiled that all these services are depending on /var/tmp existence (they all have the "PrivateTmp=yes" in their unit). Without this folder on the target filesystem, services will return "Failed to run 'start' task: No such file or directory".
>
> In order to fix that issue and submit a patch, I would like to be sure I did not miss a config in buildroot. I think the fix should take place in SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS located in package/skeleton-init-systemd.mk. Am I right?
>
> Thanks,
>

/var/tmp should have been created by systemd-tmpfiles on startup. Did
you remove the systemd-tmpfiles-setup symlinks from
/usr/lib/systemd/system/sysinit.target.wants? You can check the ststus
with systemctl, e.g.

# systemctl status --no-pager --full systemd-tmpfiles-setup
? systemd-tmpfiles-setup.service - Create Volatile Files and Directories
   Loaded: loaded
(/usr/lib/systemd/system/systemd-tmpfiles-setup.service; static;
vendor preset: enabled)
   Active: active (exited) since Wed 2019-10-30 22:13:34 UTC; 14s ago
     Docs: man:tmpfiles.d(5)
           man:systemd-tmpfiles(8)
  Process: 71 ExecStart=/usr/bin/systemd-tmpfiles --create --remove
--boot --exclude-prefix=/dev (code=exited, status=0/SUCCESS)
 Main PID: 71 (code=exited, status=0/SUCCESS)

Oct 30 22:13:34 buildroot systemd[1]: Starting Create Volatile Files
and Directories...
Oct 30 22:13:34 buildroot systemd[1]: Started Create Volatile Files
and Directories.

-- 
Carlos Santos <unixmania@gmail.com>
