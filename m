From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 27 Jan 2010 12:23:52 +0000
Subject: [Buildroot] PATCH: tslib fixes
Message-ID: <4B603058.9030001@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Have had this patch set sitting in my tree for ages.

has been discussed before  
http://lists.busybox.net/pipermail/buildroot/2008-March/019442.html and 
http://lists.busybox.net/pipermail/buildroot/2008-June/021164.html

As described in my last post on the subject:

Have looked at this again and the tslib-1.0-absbit.patch patch is
definitely wrong. ABS_MAX is 0x3f which means that it needs 63 bits.
There is a seperate bug with tslib though. The ioctl calls to get bit
and absbit are wrong. They pass in the size as sizeof(bit) * 8 but the
size should be in bytes and not bits. This means that it things the
variables are very large. If absbit is declared as only 32 bits (as in
the patch) then because of the size being passed to ioctl wrong that
call zeros bits as it is adjacent on the stack. Although the test for
EV_ABS has already passed is does mean that using_syn is never set.

I also think there is a performance optimisation that can be made.
Currently ts_input_read() checks is sane_fd == 0 and if so calls
check_fd(). I believe once the check has succeeded there is no need to
call it again for the device (I don't think input device capabilities
can change on the fly). The mechanism is already in place to do this,
check_fd() just needs to return>0 on success.


It also changes the makefile to remove options that nobody using a 
recent kernel will need and making sure that a default config gets 
copied into the target directory.

Would love to see these merged, so let me know any feedback and changes.

Will

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: 0014-tslib-fixes.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100127/c72bb93b/attachment-0001.diff>
