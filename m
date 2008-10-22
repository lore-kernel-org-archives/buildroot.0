From: John Schimandle <john_schimandle@hotmail.com>
Date: Wed, 22 Oct 2008 04:36:53 -0700
Subject: [Buildroot] docs/buildroot.html - package make file make command
	overrides configure script CC setting
Message-ID: <COL0-DAV36887D7967FE01BD250A468D290@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been stumbling through adding a package to buildroot. Although I did
make a successful package I did find a potential problem with the
documenation, buildroot usage and documentation document at
docs/buildroot.html specifically the section entitled "Extending Buildroot
with more software". This section describes the package make file in
package/name/name.mk. It shows an example of the file which I think is
incorrect. Lines 33 and 34 specify a make statement that overrides the
variable settings of CC that are set in configure. The overriding action
causes all makes within the package to have the CC variable set to TARGET_CC
and not the CC variable defined in the configure script. The CC variable in
the configure script is set by TARGET_CONFIGURE_OPTS on line 22 of this
example. TARGET_CONFIGURE_OPTS contains architecture specific information
for the compiler which is important for some packages.
 
Original statement in example
 
33  $(FOO_DIR)/$(FOO_BINARY): $(FOO_DIR)/.configured
34          $(MAKE) CC=$(TARGET_CC) -C $(FOO_DIR)
 
I think the example should have the following statements (line 33 is
unchanged)
 
33  $(FOO_DIR)/$(FOO_BINARY): $(FOO_DIR)/.configured
34          $(MAKE) -C $(FOO_DIR)
 
Now the targets see the full CC arguments that were passed to the configure
script and were written into each Makefile in the package.
 
I don't know if this would be valid for all packages but it seems to me that
you would want to preserve the CC variable setting that was done with the
configure script.
 
Again, I'm not sure how to submit this change to the buildroot tree.
 
Regards,
 
John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081022/b2f0dc99/attachment-0001.htm 
