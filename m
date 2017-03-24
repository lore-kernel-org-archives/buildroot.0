From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 23 Mar 2017 23:19:27 -0300
Subject: [Buildroot] [PATCH v3 1/5] support/testing: core testing
	infrastructure
References: <20170323090751.68c281d2@free-electrons.com>
Message-ID: <58d4822f200b_4df43fece49a741c33146@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Mar 23, 2017 at 05:07 AM, Thomas Petazzoni wrote:

>> error: [Errno 104] Connection reset by peer
> 
> Hum, do you know why this one happens? I definitely understand that
> will a qemu is running, another qemu cannot bind its telnet server on
> the same TCP port, but I don't see why it would cause a "Connection
> reset by peer".

It is not clear to me why this one happens.

> Or is the logic of the test bogus, and if it doesn't manage to start
> qemu, the test still continues, and it in fact connects to an already
> running qemu instance from a different test, which then gets killed in
> the middle ?

I redirected the output from Popen to stdout and stderr and when the error
occurs only the messages from the first qemu appear before the Traceback:

[output/TestPythonBase/2017-03-23 20:52:29] Starting
QEMU waiting for connection on: disconnected:telnet::1234,server
pulseaudio: set_sink_input_volume() failed
pulseaudio: Reason: Invalid argument
pulseaudio: set_sink_input_mute() failed
pulseaudio: Reason: Invalid argument
[output/TestPythonBase/2017-03-23 20:52:37] Cleaning up
.[output/TestDropbear/2017-03-23 20:52:37] Starting
[output/TestDropbear/2017-03-23 20:52:37] Cleaning up
E

So I suppose it could be a bogus logic.

Anyway I think waiting for "waiting for connection" before connecting should be
more reliable to know the qemu started than just trying to connect using
telnet.

Regards,
Ricardo
