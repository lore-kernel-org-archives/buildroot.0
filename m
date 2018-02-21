From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Date: Wed, 21 Feb 2018 13:42:32 +0100
Subject: [Buildroot] BUG: systemd/dbus broken in -rc1
Message-ID: <c2b37eb8-10f7-f27c-6175-6b3f08e937be@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody

I have a systemd course where I use a minimal buildroot system as my 
exercise machine.
It is a very minimal configuration based on 86_64+systemd+not much else.

since the update of systemd to v237 there has been various problems 
related to the
connexion between systemd and dbus. The easiest way to test is to run 
"busctl" on
the system. It won't work complaining about "no such file or directory"

This bug affects more or less all systemd-provided utilities, including 
logind and systemd
itself.


After investigating, the problem is that systemd looks for the dbus 
socket in /run/dbus instead of
/var/run/dbus which is not where dbus puts the socket.

However, systemd mandates that /run be a symlink to /var/run. The file 
/usr/lib/tmpfiles.d/var.con
will create automatically that symlink at bootup. So in theory, looking 
at the socket in /run should
work too.

However, there is a second stacked bug. dbus creates, at install time, 
the directory /var/run/dbus.
This breaks tmpfile.d which will not create the symlink since the 
directory already exists.
Creating a file in /var/run makes no sense in the first place since that 
directory is a tmpfs and will
be emptied at reboot time

Now, I am not sure what to do from here on the buildroot side. I think 
it could be usefull to have
some sort of security to check that /var/run doesn't exist and yell 
loudly if it does, but I don't know
how to implement that

An other approch would be for the systemd skeleton to create /var/run as 
a symlink to ../run
(not /run) in order to let stuff be installed. The tmpfs mount at boot 
time would hide the content,
but it should work

To sum it up :
* systemd should look for the socket in /var/run : 
https://github.com/systemd/systemd/issues/8197
* dbus should not create the /run/dbus directory in the first place : 
bug to be opened
* buildroot needs to make sure /var/run is not created or is a correct 
symlink.

I'd gladly take advice on what to do to move forward on that issue...

Regards
J?r?my



-- 
SMILE <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine

	
*J?r?my ROSEN*
Architecte technique
Responsable de l'expertise Smile-ECS

email jeremy.rosen at smile.fr <mailto:jeremy.rosen@smile.fr>
phone +33141402967
url http://www.smile.eu

Twitter <https://twitter.com/GroupeSmile> Facebook 
<https://www.facebook.com/smileopensource> LinkedIn 
<https://www.linkedin.com/company/smile> Github 
<https://github.com/Smile-SA>


D?couvrez l?univers Smile, rendez-vous sur smile.eu 
<http://smile.eu/?utm_source=signature&utm_medium=email&utm_campaign=signature>

eco Pour la plan?te, n'imprimez ce mail que si c'est n?cessaire
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180221/f796e003/attachment.html>
