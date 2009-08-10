From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Mon, 10 Aug 2009 09:37:00 +0200
Subject: [Buildroot] [PATCH] Re: buildroot-libtool.patch failed with
 dbus 1.3.0
In-Reply-To: <20090810001703.396c8e38@surf>
References: <4A7C85F0.7070604@eclis.ch>
	<20090807221717.53039a10@surf>	<4A7C9F65.4060104@eclis.ch>
	<20090808004346.443b9e49@surf>	<4A7CB3CC.8040401@eclis.ch>
	<20090808200911.4e986c77@surf>	<4A7DFDF4.3020103@eclis.ch>
	<20090810001703.396c8e38@surf>
Message-ID: <4A7FCE1C.9060500@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni a ?crit :
> Le Sun, 09 Aug 2009 00:36:36 +0200,
> Jean-Christian de Rivaz <jc@eclis.ch> a ?crit :
> 
>>> However, while dbus compilation works successfully now, dbus-glib
>>> still fails to build here:
>>>
>>>  /usr/lib/libgobject-2.0.so: could not read symbols: File in wrong
>>>  format collect2: ld returned 1 exit status
>>>
>>> So it's a libtool patch issue, again :-)
>> That's strange since I use dbus-glib on a ARM target for about 20
>> applications with the dbus-1.3.0 without that problem. I usually get
>> the wrong format message when I have not do a make clean before
>> switching to an other architecture. Can you post more lines before
>> the error so I can compare with my own build ?
> 
> The difference between my setup and your setup is probably that I do
> actually have /usr/lib/libgobject-2.0.so in my filesystem, since the
> libglib2.0-dev package is installed on my distribution. In your case,
> this package is probably not installed, and therefore, libtool doesn't
> think that the correct libgobject library is in /usr/lib.

But I have the usr/lib/libgobject-2.0 on my system:
$ file /usr/lib/libgobject-2.0.so
/usr/lib/libgobject-2.0.so: symbolic link to `libgobject-2.0.so.0.1600.6'
$ file /usr/lib/libgobject-2.0.so.0.1600.6
/usr/lib/libgobject-2.0.so.0.1600.6: ELF 64-bit LSB shared object, 
x86-64, version 1 (SYSV), dynamically linked, stripped

> I've actually tried this hypothesis on another package (webkit that was
> failing in a similar way on libenchant), and remove the development
> files in /usr/lib, and the link succeeded.
> 
> It seems to be hard to convince libtool that /usr/lib does *not*
> contain anything interesting.

Yes. This is a common problem with libtool while cross-compiling.
Sometime the problem are in the *.la files installed into the staging.

Best regards,

Jean-Christian de Rivaz
