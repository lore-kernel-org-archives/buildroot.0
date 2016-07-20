From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Wed, 20 Jul 2016 11:39:45 -0400
Subject: [Buildroot] BUG? Python3.x build and CPIO issue
Message-ID: <CAN34foyej3N+jYMjFf=_jwgNfCkq5AbVaB07WOwBoffYmXe5SQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
   I have a Buildroot 2015.08.1 setup, running on a RHEL6.4 "corporate
server" (this is a Linux 2.6.32 based kernel).  The GCC we're using is
4.4.7.
   I've enabled Python3 in the Buildroot configuration.  The build succeeds
just fine and I get the following output in the output/target/usr/bin
directory:

[sbeckwit at cycrh6ptc19 bin]$ ls -l py*

lrwxrwxrwx 1 sbeckwit engr    7 Jul 14 15:48 python -> python3

lrwxrwxrwx 1 sbeckwit engr    9 Jul 14 15:48 python3 -> python3.4

-rwxr-xr-x 2 sbeckwit engr 3872 Jul 14 16:02 python3.4

-rwxr-xr-x 2 sbeckwit engr 3872 Jul 14 16:02 python3.4m

lrwxrwxrwx 1 sbeckwit engr   10 Jul 14 15:48 pyvenv -> pyvenv-3.4

The uImage gets build and booted on the target (ARMv7 based SOC).  However,
when I try to run python, it doesn't run.  Checking /usr/bin, I see the
following:

# ls -l py*

lrwxrwxrwx 1 root root  7 Jul 14  2016 python -> python3

lrwxrwxrwx 1 root root  9 Jul 14  2016 python3 -> python3.4

-rwxr-xr-x 2 root root  0 Jul 14  2016 python3.4

-rwxr-xr-x 2 root root  0 Jul 14  2016 python3.4m

lrwxrwxrwx 1 root root 10 Jul 14  2016 pyvenv -> pyvenv-3.4

Hmm. . .
Checking the rootfs.tar - things look OK.  However, when I unpack the CPIO
into a temp directory, the python3.4 file is now 0 bytes, as it is on the
target.
The CPIO version we have on our host is 2.10.
Is there a known bug here?  With CPIO?
User disks are NFS mounted in a "corporate" environment.

Removal of the python3.4m file allows the CPIO to work correctly and python
is present and works on the target.
What is the "m" file?  Why is it built?

When I build this on a different server, running FedoraCore 22 (Linux 4.0.4
kernel, GCC 5.3.1, CPIO 2.11) there is no issue.  The python3.4 file makes
it to the target intact and python runs OK.

The Buildroot manual only specifies specific versions for make, gcc, g++,
perl, and python, which our system meets.  I searched the mailing list
archives, without any valid results (until the site became unresponsive,
yes, I've read about the recent issues).

Thank you in advance for your feedback and guidance.

Regards,
Stephen Beckwith
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160720/23605fc2/attachment.html>
