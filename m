From: Will C <willjcroz@yahoo.co.uk>
Date: Tue, 30 Sep 2008 21:07:06 +0000 (GMT)
Subject: [Buildroot] wake on ring support
In-Reply-To: <BAY107-W4782F02FE41BDF61DCBA39D430@phx.gbl>
Message-ID: <811828.28896.qm@web26001.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I am trying to get wake on ring working on an advantech
> board with linux (built using buildroot, kernel version
> 2.6.24). I can make linux go to sleep using the command echo
> standby >/sys/power/state. But I am unable to wake it up
> using wake on ring. Advantech documents applying 5 volts on
> some pin to wake it up. Is there any parameter in buildroot
> config which enables/disables this support? It does work
> with windows Xp.

I'm not sure if buildroot has specific support for this or not.

If it works in XP then it should work in Linux without using +5v on that pin. What is the device you are using to wake up the board? If you know what kind of bus it is connected to (and are using acpi) look in
/proc/acpi/wakeup to see if it is wakeup enabled:

cat /proc/acpi/wakeup

if not do (for example with PCI0 device) :

echo PCI0 > /proc/acpi/wakeup

then try going to standby. If it works you will probably want to add it to your init scipts so that it is enabled whenever it goes into standby.

Of course if it is a NIC then you also need to use ethtool, e.g:

/usr/sbin/ethtool -s eth0 wol g


regards,

Will Crozier


      
