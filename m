From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 7 Feb 2012 16:45:33 +0000 (UTC)
Subject: [Buildroot] Customize package not copy .svn .git etc?
Message-ID: <jgrkfd$m8n$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do other users of the customize package not use svn, git, CVS, etc?

I build from a subversion working copy, and customize.mk is copying
all of the .svn directories to the target.  I'm looking at
customize.mk, to leave out things like .svn and .git directories and
I'm a bit confused.  Here's what it looks like now:

CUST_DIR:=package/customize/source

$(BUILD_DIR)/.customize:
        rm -f $(BUILD_DIR)/series
        (cd $(CUST_DIR); \
        /bin/ls -d * > $(BUILD_DIR)/series || \
        touch $(BUILD_DIR)/series )
        for f in cat $(BUILD_DIR)/series; do \
               cp -af $(CUST_DIR)/$$f $(TARGET_DIR); \
        done
        rm -f $(BUILD_DIR)/series
        touch $@

I don't really understand the purpose of the "cd" command and the
"series" file.  Isn't this the same thing?

$(BUILD_DIR)/.customize:
        for f in $$(ls -d $(CUST_DIR)/*); do cp -af $$f $(TARGET_DIR); done
        touch $@

-- 
Grant Edwards               grant.b.edwards        Yow! ... this must be what
                                  at               it's like to be a COLLEGE
                              gmail.com            GRADUATE!!
