From: Stanley <eva2002@gmail.com>
Date: Tue, 15 Dec 2009 15:30:06 +0800
Subject: [Buildroot] update on a file in tslib not reflected after doing
	"Make"
Message-ID: <ed7750810912142330nbfb9fb5q2b261926c6d2b4c2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am new to embedded world and this is the first time using buildroot.
I am currently trying to solve a problem in one of the files (input-raw.c)
on tslib. However after modify/patch the file, I do a "make" in main
buildroot directory. However the changes did not reflected (tested by adding
a few texts in already existing printf statement).

eg:

input-raw.c
-------------
original file
fprint(stderr,"Unknown event type %d\n",......);

modified file
fprintf(stderr,"test\n,"Unknown event type %d\n",......);

ts_calibrate.c
---------------
original file
printf("xres = %d, yres = %d\n", xres, yres);

modified file
printf("test\nxres = %d, yres = %d\n", xres, yres);


I am using at91rm9200dk board by the way.

Here is what I did.

1) delete "tslib" folder from "build_arm" folder.
2) delete "ts" folder and "libts.la", "libts.so", "libts-0.0.so.0" and
"libts-0.0.so.0.1.1" files from "build_arm/staging_dir/usr/lib" folder. I
think this is all the lib files for tslib
3) delete "ts_calibrate", "ts_print_raw", "ts_print", "ts_test",
"ts_harvest" files from "build_arm/staging_dir/usr/lib/bin" folder. these
are the test problem.
4) do a "make" in main buildroot directory.
5) break the "make" process halfway (after extracting and patching of the
input-raw.c file before running autoconf) and modify/patch the
file(s)(modify ts_calibrate for checking) and do a "make" to resume the
process.
6) download the kernel image and rootfs into the arm9 board and run the
tslib test. (ts_calibrate). Result = printf of the original file shown in
the examples above.

For step 5, I have to break halfway because the patch I added cannot be done
before buildroot tslib patch as it will cause a patch fail for buildroot
tslib patch. I have no idea what problem is buildroot tslib patch solve but
it is did not solve the problem I encounter.

Note: Here is how I do a patch before buildroot. 1) patch file, 2) zip whole
folder, 3) copy to dl folder, 4) delete relevant files and folder, 5) do a
make. I can't do it for tslib as buildroot tslib patch will fail with the
patch I am applying.

Anyone knows how to resolve this problem?

thanks

Regards,
Stanley
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091215/94e1189e/attachment-0001.htm>
