From: Enoch W. <ixew@hotmail.com>
Date: Wed, 16 Jan 2019 19:04:07 +0000
Subject: [Buildroot] /etc/init.d init script question
In-Reply-To: <1169191239.2324717.1547654399994.JavaMail.zimbra@datacom.com.br>
References: <SN6PR01MB50378585F4037C76C9DD6376CC870@SN6PR01MB5037.prod.exchangelabs.com>
 <1169191239.2324717.1547654399994.JavaMail.zimbra@datacom.com.br>
Message-ID: <SN6PR01MB5037188FF0A182CB38F334E1CC820@SN6PR01MB5037.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks, I solved my problem, I don't know if to call it a busybox deficiency or not:

/etc/init.d/rcS does not work with my root environment, so I had to help it through the init.d/ script:
myenv.sh is just a series of variable exports.

    printf "Starting $DAEMON: "
    . /etc/profile.d/myenv.sh
    start-stop-daemon -S -b -m -q -p "$PIDFILE" -x "/usr/bin/python" -- "/root/myscript.py"

Obviously, when I launched the daemon through a regular terminal session it had the full root environment, hence it behaved normally.

I suggest to mention that in the buildroot manual since /etc/init.d/rcS does not display any error message...


On 1/16/19 6:00 PM, Carlos Santos wrote:

From: "Enoch W." <ixew@hotmail.com><mailto:ixew@hotmail.com>
To: "buildroot" <buildroot@busybox.net><mailto:buildroot@busybox.net>
Sent: Domingo, 13 de janeiro de 2019 20:57:48
Subject: [Buildroot] /etc/init.d init script question





Hi,





I'm using a recent buildroot tag 2018.11 (651).





Can anyone suggest how to debug a python script that starts well from a command
line:





# /etc/init.d/S53myscript start
Starting myscript: OK





but fails to start on boot via /etc/init.d/rcS





It's a python script that is launched as follows:





printf "Starting $DAEMON: "
start-stop-daemon -S -b -m -q -p "$PIDFILE" -x "/usr/bin/python" --
"/root/myscript.py"





Since the $PIDFILE is well created rcS must have ended well and it's my python
script to blame, but how can I see what exception it throws...



I suspect that your script fails because it needs something that is
initialized later.



PS1. I've tried adding a long sleep in case "something" isn't ready.





PS2. How can one simulate /etc/init.d/rcS environment ...



Init scripts run with stdin redirected to /dev/null so run it with

    # /etc/init.d/S53myscript start < /dev/null



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190116/f60f43c6/attachment-0001.html>
