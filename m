From: nina.holly at aerende.com <nina.holly@aerende.com>
Date: Fri, 13 Apr 2007 07:45:10 -0700 (PDT)
Subject: [Buildroot] frame buffer problems
In-Reply-To: <876481fx5p.fsf@sleipner.barco.com>
References: <2034.63.193.249.101.1175876073.squirrel@webmail.aerende.com>   
	<43e72e890704061005g7acb436es181f5d9e2c788427@mail.gmail.com>   
	<2666.63.193.249.101.1175952704.squirrel@webmail.aerende.com>   
	<87tzvoogsd.fsf@sleipner.barco.com>   
	<2831.63.193.249.101.1176390028.squirrel@webmail.aerende.com>   
	<876481fx5p.fsf@sleipner.barco.com>
Message-ID: <3709.63.193.249.101.1176475510.squirrel@webmail.aerende.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>> "nina" == nina holly <nina.holly@aerende.com> writes:
>
>>> What is the return value of open?
>
> nina> Return value of open = -1
>
> And errno is?

The strerror(errno) = "Success".

The open had returned -1 because the link from /dev/fb0 to /dev/fb/0
was gone.  Once the programs both used /dev/fb/0 their return and
errno values were the same which are listed below (except for mmap errno,
the first program returned "Success" even though the return value was
-1):

return of open = 3
errno of open = Success
return of ioctl(fixed info) = 0
errno of ioctl(fixed info) = Success
return of ioctl(var info) = 0
errno of ioctl(var info) = Success
return of mmap = -1
errno of mmap = bad address

So it looks like both programs have trouble using "mmap" on
the framebuffer /dev/fb/0 for buildroot version 17224 whereas
these programs work fine with buildroot version 15763.

These programs when run on the earlier version of buildroot 15763
that works have the following return values and errnos.

return of open = 3
errno of open = Success
return of ioctl(fixed info) = 0
errno of ioctl(fixed info) = Success
return of ioctl(var info) = 0
errno of ioctl(var info) = Success
return of mmap = 1074180096
errno of mmap = Success

TIA,

Nina


>
> nina> I have another frame buffer program that draws a checkerboard on
nina> the screen.  On the same buildroot version and board the return
nina> values from open and the ioctls are not less than zero, but the
nina> program crashes with a segmentation fault when pixels are
> nina> written to the screen buffer.
>
> Odd. Exact same binaries, or recompiled with the new uclibc?
>
> --
> Bye, Peter Korsgaard
>
