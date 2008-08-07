From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 07 Aug 2008 14:06:31 +0200
Subject: [Buildroot] ser2net package
In-Reply-To: <489AE036.3030202@gmail.com>
References: <4899C35D.20307@gmail.com> <489AA62F.2020109@cetrtapot.si>
	<489AD7C0.3020505@gmail.com> <489ADA1E.5040903@cetrtapot.si>
	<489AE036.3030202@gmail.com>
Message-ID: <489AE547.9060204@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Leonardo Giordano wrote:
> Well, I have not done so much. I am a newbie on this.
> Basically, I copied the "wget" package dir to write the "ser2net" package. Then 
> I just made some renames (wget -> ser2net). My ser2net.mk is attached.

great!

> The when executing make, it says:
> 
> dataxfer.c:2007: error: 'B230400' undeclared here (not in a function)
> make[1]: *** [dataxfer.o] Error 1

Yes, I see it too on i386 arch. The missing 'B230400' definition should 
probably be in termios.h uClibc header. For i386 there is a comment in
/buildroot/build_i386/staging_dir/usr/include/bits/termios.h saying:

#if 0 /* limited on uClibc, keep in sync w/ cfsetspeed.c */
#define  B230400  0010003
#define  B460800  0010004
#define  B500000  0010005
#define  B576000  0010006
#define  B921600  0010007
#define  B1000000 0010010
#define  B1152000 0010011
#define  B1500000 0010012
#define  B2000000 0010013
#define  B2500000 0010014
#define  B3000000 0010015
#define  B3500000 0010016
#define  B4000000 0010017
#define __MAX_BAUD B4000000
#else
#define __MAX_BAUD B115200
#endif

On cris arch this is not the case... the package compiles without a glitch!

I don't have a nice fix for this, but completely removing the 2007 line
in dataxfer.c works for me (at least it compiles all the way through), 
but I haven't tested it on real hardware.

HTH,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
