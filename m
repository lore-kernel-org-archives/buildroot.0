From: Brent Sink <brents_3@hotmail.com>
Date: Thu, 11 May 2017 04:47:58 +0000
Subject: [Buildroot] USB CDC port - characters I type are off by one bit
Message-ID: <BN6PR03MB291420971B86EA3111F59E78BFED0@BN6PR03MB2914.namprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


I'm using Buildroot and I'm seeing something really strange with some of the serial ports that are enumerated from a USB modem.  I'm using a u-blox 3G modem and it creates several ttyACMx ports.  What I'm seeing is that when I use screen or minicom to send AT commands, the characters I type appear to be missing the first bit.  For example, if I type "A", I get "@".  If I type "B", I get "B".  If I type "C", I get "B", and so on.  The letters A-Z = "@BBDDFFHHJJLLNNPPRRTTVVXXZ".


My first reaction would be that the serial port is set up for 7 bits instead of 8, but when I check the serial port, it is indeed set for 8 bits.  But wait, it gets weirder.  Using screen (minicom doesn't do this), if I paste the contents of my clipboard into screen, it works.  If the letters "AT" are pasted, it shows up as "AT" and I get an OK back.  Any ideas what may be going on?  Are the serial ports not being set up correctly?


Here are the default settings on the ttyACM0 port:

# stty -F /dev/ttyACM0 -a
speed 9600 baud;stty: /dev/ttyACM0
 line = 0;
intr = ^C; quit = ^\; erase = ^?; kill = ^H; eof = ^D; eol = <undef>;
eol2 = <undef>; swtch = <undef>; start = ^Q; stop = ^S; susp = ^Z; rprnt = ^R;
werase = ^W; lnext = ^V; flush = ^O; min = 100; time = 2;
-parenb -parodd cs8 -hupcl -cstopb cread clocal -crtscts
-ignbrk brkint ignpar -parmrk -inpck -istrip -inlcr -igncr -icrnl ixon -ixoff
-iuclc -ixany -imaxbel -iutf8
-opost -olcuc -ocrnl -onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0
ff0
-isig -icanon iexten -echo echoe echok -echonl -noflsh -xcase -tostop -echoprt
echoctl echoke


On another note, I do not know if this is related or simply a coincidence, I also have a GPS module that is connected to a real UART port.  When I read the output from the GPS module, I get these messages at the start, before it starts spitting out data from the GPS.
imx-sdma 20ec000.sdma: Timeout waiting for CH0 ready
imx-uart 21e8000.serial: error in RX dma configuration.

...and sometimes I'll get this message over and over with no end:
imx-uart 21e8000.serial: Rx FIFO overrun

Perhaps it's related, or perhaps not, but I wanted to mention it just in case.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170511/68f1cafa/attachment.html>
