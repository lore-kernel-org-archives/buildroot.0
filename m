From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Feb 2016 16:33:21 +0100
Subject: [Buildroot] [dropbear] fail ssh conection with Passwords
	encoding SHA-256 or SHA-512
In-Reply-To: <CALtfCQbqTNvokwneH9uFFESNFK6_HZWKy19oefELL4OgDw-jpw@mail.gmail.com>
 (=?utf-8?B?IsOTc2NhciBHw7NtZXo=?= Fuente"'s message of "Fri, 26 Feb 2016
 09:50:12 +0100")
References: <CALtfCQbqTNvokwneH9uFFESNFK6_HZWKy19oefELL4OgDw-jpw@mail.gmail.com>
Message-ID: <87h9gvv64e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "?scar" == ?scar G?mez Fuente <oscargomezf@gmail.com> writes:

 > Hi,
 > I'm new in buldroot and I'm building a raspberry 2 platform. I've based on
 > raspberrypi2_defconfig configuration. But I've changed two things:

 > 1?.- I've added dropbear to add ssh functionality.

 > Everything works fine and I can connect to my raspberry by ssh (System
 > password encoding md5). The problem is when I've changed the password
 > encoding from md5 to SHA-256 or SHA-512. When I've tried to make an ssh
 > conection from a PC to my raspberry pi 2 the access fail:

 > root at 192.168.10.105's password:
 > Permission denied, please try again.

The problem is that uClibc doesn't have support for the sha256/512
ciphers by default, so dropbear cannot authenticate you. It happens to
work when you login through serial as the busybox login program uses
built in password handling functions (and we have code to enable the
sha256/512 routines when enabled in buildroot).

I guess we need to do the same for uClibc (or just unconditionally
enable it). In the mean time you can use glibc instead which does
support it (make sure you do a clean build whenever you change toolchain
options).

-- 
Bye, Peter Korsgaard
