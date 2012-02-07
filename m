From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 7 Feb 2012 17:12:17 +0000 (UTC)
Subject: [Buildroot] Customize package not copy .svn .git etc?
References: <jgrkfd$m8n$1@dough.gmane.org>
Message-ID: <jgrm1h$3h3$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-02-07, Grant Edwards <grant.b.edwards@gmail.com> wrote:

>[...]
>
> I don't really understand the purpose of the "cd" command and the
> "series" file.  Isn't this the same thing?
>
> $(BUILD_DIR)/.customize:
>         for f in $$(ls -d $(CUST_DIR)/*); do cp -af $$f $(TARGET_DIR); done
>         touch $@

Or, now that I think about it, how about the even simpler:

$(BUILD_DIR)/.customize:
        cp -af $$(ls -d $(CUST_DIR)/*) $(TARGET_DIR)
        touch $@

The only difference is that the last one will produce an error and the
build will fail if $CUST_DIR is empty -- which wouldn't bother me at
all, but maybe there are others who enable the customize package but
don't give it any files to copy.

One option is to delete the unwanted files after the copy:

$(BUILD_DIR)/.customize:
        cp -af $$(ls -d $(CUST_DIR)/*) $(TARGET_DIR)
        rm -rf $$(find $(TARGET_DIR) -type d -name .svn)
        touch $@

The other obvious choice would be to use tar:

$(BUILD_DIR)/.customize:
        tar -c -f - -C $(CUST_DIR) --exclude-vcs --exclude-backup . | tar -x -f - -C $(TARGET_DIR)
        touch $@

I'd be happy to submit a patch containing the latter if everybody
agrees that they don't want vcs files, backup files, and lockfiles
copied.  It is specific to gnu tar -- I assume that's not a problem?

-- 
Grant Edwards               grant.b.edwards        Yow! The PILLSBURY DOUGHBOY
                                  at               is CRYING for an END to
                              gmail.com            BURT REYNOLDS movies!!
