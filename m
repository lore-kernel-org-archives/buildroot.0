From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 8 Sep 2013 12:59:23 -0400
Subject: [Buildroot] [RFCv1 01/11] Makefile: make $(BUILD_DIR)/.root
	rule idempotent
In-Reply-To: <20130908153034.10b46fdf@skate>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <CANxTyt4-UNps4mw2KRMbg9TGjj03e5eL5vczCJORuE4as4HwQg@mail.gmail.com>
 <20130908153034.10b46fdf@skate>
Message-ID: <CANxTyt5T+GUhU4EuDChEvfPze-9uCAb8mMNy-X-2Jn=fmMi9rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Sep 8, 2013 at 9:30 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:
>
> > Wouldn't just changing the "ln -s" to "ln -snf" be sufficient?  After
> > all, that's what is being done to make $(STAGING_DIR):
>
> I think, when I tried it, it wasn't working: at the second invocation,
> it creates a symbolic link *within* the lib directory. Example:
>
> thomas at skate:/tmp$ mkdir target
> thomas at skate:/tmp$ cd target/
> thomas at skate:/tmp/target$ ls
> thomas at skate:/tmp/target$ mkdir lib
> thomas at skate:/tmp/target$ ls lib/
>
> # lib/ is empty
>
> thomas at skate:/tmp/target$ ln -sf lib lib32
> thomas at skate:/tmp/target$ ls -l
> total 0
> drwxrwxr-x 2 thomas thomas 40 sept.  8 15:27 lib
> lrwxrwxrwx 1 thomas thomas  3 sept.  8 15:28 lib32 -> lib


 "ln -sf" is not sufficient for a symlink to a directory - you need "ln
-snf" - the -n treats the directory symlink as a file, which prevents this
very problem.

Example based on your example:

/tmp$ mkdir -p target/lib
/tmp$ cd target
/tmp/target$ ls lib/

# lib/ is empty

/tmp/target$ ln -snf lib lib32
/tmp/target$ ls -l
total 4
drwxrwxr-x 2 dmanchego dmanchego 4096 Sep  8 12:49 lib
lrwxrwxrwx 1 dmanchego dmanchego    3 Sep  8 12:50 lib32 -> lib
/tmp/target$ ls lib/

# we have the symbolic link, lib/ is empty

/tmp/target$ ln -snf lib lib32
/tmp/target$ ls -l
total 4
drwxrwxr-x 2 dmanchego dmanchego 4096 Sep  8 12:49 lib
lrwxrwxrwx 1 dmanchego dmanchego    3 Sep  8 12:50 lib32 -> lib
/tmp/target$ ls lib/

# still good!

/tmp/target$ ln -snf lib lib32
/tmp/target$ ls -l
total 4
drwxrwxr-x 2 dmanchego dmanchego 4096 Sep  8 12:49 lib
lrwxrwxrwx 1 dmanchego dmanchego    3 Sep  8 12:50 lib32 -> lib
/tmp/target$ ls lib/

# still good!

Using the "ln -snf" lets you drop the if statements, so it seems desirable.

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130908/98c200b2/attachment-0001.html>
