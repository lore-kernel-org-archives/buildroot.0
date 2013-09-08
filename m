From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 15:30:34 +0200
Subject: [Buildroot] [RFCv1 01/11] Makefile: make $(BUILD_DIR)/.root
 rule idempotent
In-Reply-To: <CANxTyt4-UNps4mw2KRMbg9TGjj03e5eL5vczCJORuE4as4HwQg@mail.gmail.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <CANxTyt4-UNps4mw2KRMbg9TGjj03e5eL5vczCJORuE4as4HwQg@mail.gmail.com>
Message-ID: <20130908153034.10b46fdf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sun, 8 Sep 2013 09:13:30 -0400, Danomi Manchego wrote:

> > $(TARGET_DIR_WARNING_FILE)
> > -       @ln -s lib $(TARGET_DIR)/$(LIB_SYMLINK)
> > -       @mkdir -p $(TARGET_DIR)/usr
> > -       @ln -s lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
> > +       $(Q)if [ ! -L $(TARGET_DIR)/$(LIB_SYMLINK) ]; then \
> > +               ln -s lib $(TARGET_DIR)/$(LIB_SYMLINK) ; \
> > +       fi
> > +       $(Q)mkdir -p $(TARGET_DIR)/usr
> > +       $(Q)if [ ! -L $(TARGET_DIR)/usr/$(LIB_SYMLINK) ]; then \
> > +               ln -s lib $(TARGET_DIR)/usr/$(LIB_SYMLINK) ; \
> > +       fi
> >         touch $@
> >
> >  $(TARGET_DIR): $(BUILD_DIR)/.root
> 
> 
> Wouldn't just changing the "ln -s" to "ln -snf" be sufficient?  After
> all, that's what is being done to make $(STAGING_DIR):

I think, when I tried it, it wasn't working: at the second invocation,
it creates a symbolic link *within* the lib directory. Example:

thomas at skate:/tmp$ mkdir target
thomas at skate:/tmp$ cd target/
thomas at skate:/tmp/target$ ls
thomas at skate:/tmp/target$ mkdir lib
thomas at skate:/tmp/target$ ls lib/

# lib/ is empty

thomas at skate:/tmp/target$ ln -sf lib lib32
thomas at skate:/tmp/target$ ls -l
total 0
drwxrwxr-x 2 thomas thomas 40 sept.  8 15:27 lib
lrwxrwxrwx 1 thomas thomas  3 sept.  8 15:28 lib32 -> lib
thomas at skate:/tmp/target$ ls lib/

# we have the symbolic link, lib/ is still empty. Now we will create
# the symbolic link again

thomas at skate:/tmp/target$ ln -sf lib lib32
thomas at skate:/tmp/target$ ls -l
total 0
drwxrwxr-x 2 thomas thomas 60 sept.  8 15:28 lib
lrwxrwxrwx 1 thomas thomas  3 sept.  8 15:28 lib32 -> lib
thomas at skate:/tmp/target$ ls -l lib/
total 0
lrwxrwxrwx 1 thomas thomas 3 sept.  8 15:28 lib -> lib

# A stale symbolic link was created in lib/

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
