From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Wed, 16 Sep 2020 08:41:47 +0200
Subject: [Buildroot] [PATCH 1/3] support/scripts/mkusers: allow option
 for system uid/gid
In-Reply-To: <CADYdroMULeB=so8q27z1PfK2yFh+myhBV_Dm6+5+AJzqKFDhQA@mail.gmail.com>
References: <20200113153516.486106-1-nolange79@gmail.com>
 <20200915224701.5f096d97@windsurf.hq.k.grp>
 <CADYdroMULeB=so8q27z1PfK2yFh+myhBV_Dm6+5+AJzqKFDhQA@mail.gmail.com>
Message-ID: <CAFvCimXckN_s=b3N0-Ys=o=q8=FQZxk3bqT5ngu8ggjXEgaOyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'll give a bit more detail about the way journald handles system/user UID.
there might be other places where systemd treats them differently, but
that's the only
one I know from memory.

journald collects all logs on the system
* from the daemons running around
* from the kernel/audit system
* from containers
* from user sessions.

When a user logs in, a "per user" instance of systemd is spawned that
can starts daemons for that user (ssh-agent, pulseaudio, colord...
daemons that make sense at the user level but not at the system level)

To ease the handling of permissions and reading those files, journald does
not store all logs in a single file, but in one file per user. Journald uses
ACL to allow each user to have access to his logs through normal unix
permissions instead of relying on some sort of SUID mechanism.

However, it would be a bad idea to have a separate journal file for system
users, since system users are part of the system and the log they produce
are really only for the administrator to see. So those logs are stored with
the
system logs in the machine's main log file.

The separation between the two types of users uses the UID1000 split

A quick grep in systemd yields a couple of other usages
* systemd-coredumps will tweak access right to allow non-system users to
  read the core-dumps they generate
* When closing a session, logind may clean up IPC for non-system user.
  The explanation is a bit complex so i'll just copy/paste the comment in
the code

        /* Clean SysV + POSIX IPC objects, but only if this is not a system
user. Background: in many setups cronjobs
         * are run in full PAM and thus logind sessions, even if the code
run doesn't belong to actual users but to
         * system components. Since enable RemoveIPC= globally for all
users, we need to be a bit careful with such
         * cases, as we shouldn't accidentally remove a system service's
IPC objects while it is running, just because
         * a cronjob running as the same user just finished. Hence: exclude
system users generally from IPC clean-up,
         * and do it only for normal users. */

* there is a unit condition calle ConditionUser= (and AssertUser=) that
  allow to limit a unit file to only be allowed for a certain user. This
condition
  can take a user name, a UID or the magic value "@system" to be allowed
  to any system user


Regards
Jeremy


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200916/dbf5dbef/attachment.html>
