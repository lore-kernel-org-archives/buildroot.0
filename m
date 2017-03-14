From: Camden Mannett <camden.mannett@gmail.com>
Date: Tue, 14 Mar 2017 12:16:48 +0000
Subject: [Buildroot] journald broken
Message-ID: <CAABucjseObERPwO_oKN9YwCKZ_bLzWspFXzj3WER7LR1FYtx+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Running journalctl results in:

No journal files were found.
-- No entries --

And there is indeed no /var/log/journal directory.  According to dmesg, the
service seems to have started successfully:

[    2.948694] systemd[1]: Listening on Journal Audit Socket.
[  OK  ] Listening on Journal Audit Socket.
[    3.096666] systemd[1]: Listening on Journal Socket.
[  OK  ] Listening on Journal Socket.
[    3.466715] systemd[1]: Listening on Journal Socket (/dev/log).
[  OK  ] Listening on Journal Socket (/dev/log).
[    3.553396] systemd[1]: Starting Journal Service...
         Starting Journal Service...
[    3.889843] systemd-journald[110]: File
/var/log/journal/71cfe6ec9cf2479db13bf609826dd52d/system.journal corrupted
or uncleanly shut down, renaming and replacing.
[    4.278073] systemd[1]: Started Journal Service.
[  OK  ] Started Journal Service.
         Starting Flush Journal to Persistent Storage...
[    4.739929] systemd-journald[110]: Received request to flush runtime
journal from PID 1
[  OK  ] Started Flush Journal to Persistent Storage.

As you can see there is an error regarding a corrupted journal (this was
the first boot, so there was unlikely to be a journal to load), but it was
apparently replaced - where I don't know as there's no /var/log/journal
directory.

I've seen an old related bug #7892, and the solution was to set the
'Storage' key to 'Volatile' in journald.conf.  However that has not worked
for me.  Does anyone have any suggestions?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170314/bf149efe/attachment.html>
