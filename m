From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Mon, 15 Dec 2008 14:35:09 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20081215223509.E53CE3C68E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2008-12-15 14:35:09 -0800 (Mon, 15 Dec 2008)
New Revision: 24428

Log:
Documentation fixes and updates

The biggest update is to document the Makefile.autotools.in way of
writing .mk files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2008-12-15 22:14:02 UTC (rev 24427)
+++ trunk/buildroot/docs/buildroot.html	2008-12-15 22:35:09 UTC (rev 24428)
@@ -117,7 +117,7 @@
     <h2><a name="download" id="download"></a>Obtaining Buildroot</h2>
 
     <p>Buildroot is available as daily SVN snapshots or directly using
-    SVN. </p>
+    SVN. As of today, no stable releases of Buildroot are made. </p>
 
     <p>The latest snapshot is always available at <a
     href="http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2">http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2</a>,
@@ -444,7 +444,7 @@
     </ul>
 
     <p>The main Makefile do the job through the following steps (once the
-    configuration is done):</p>
+    configuration is done) :</p>
 
     <ol>
       <li>Create the download directory (<code>dl/</code> by default). This is
@@ -890,7 +890,7 @@
     things in your software. </p>
     <p>Finally you have to add your new <code>foo/Config.in</code> to
     <code>package/Config.in</code>. The files included there are
-    <em>sorted alphabetically</em> per category and are <em>NOT<em>
+    <em>sorted alphabetically</em> per category and are <em>NOT</em>
     supposed to contain anything but the <em>bare</em> name of the package.</p>
 <pre>
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
@@ -906,69 +906,140 @@
    <p>Finally, here's the hardest part. Create a file named
    <code>foo.mk</code>. It will contain the <i>Makefile</i> rules that
    are in charge of downloading, configuring, compiling and installing
-   the software. Below is an example that we will comment
-   afterwards. </p>
+   the software.</p>
 
+   <p>Two types of <i>Makefiles</i> can be written&nbsp;:</p>
+
+   <ul>
+    <li>Makefile for autotools-based (autoconf, automake, etc.)
+    softwares, are very easy to write thanks to the infrastructure
+    available in <code>package/Makefile.autotools.in</code>.</li>
+    <li>Makefile for other types of packages are a little bit more
+    complex to write.</li>
+   </ul>
+
+   <p>First, let's see how to write a <i>Makefile</i> for an
+   autotools-based package, with an example&nbsp;:</p>
+
 <pre>
-     <a name="line1" id="line1">1</a>  #############################################################
-     <a name="line2" id="line2">2</a>  #
-     <a name="line3" id="line3">3</a>  # foo
-     <a name="line4" id="line4">4</a>  #
-     <a name="line5" id="line5">5</a>  #############################################################
-     <a name="line6" id="line6">6</a>  FOO_VERSION:=1.0
-     <a name="line7" id="line7">7</a>  FOO_SOURCE:=foo-$(FOO_VERSION).tar.gz
-     <a name="line8" id="line8">8</a>  FOO_SITE:=http://www.foosoftware.org/downloads
-     <a name="line9" id="line9">9</a>  FOO_DIR:=$(BUILD_DIR)/foo-$(FOO_VERSION)
-    <a name="line10" id="line10">10</a>  FOO_BINARY:=foo
-    <a name="line11" id="line11">11</a>  FOO_TARGET_BINARY:=usr/bin/foo
-    <a name="line12" id="line12">12</a>
-    <a name="line13" id="line13">13</a>  $(DL_DIR)/$(FOO_SOURCE):
-    <a name="line14" id="line14">14</a>          $(WGET) -P $(DL_DIR) $(FOO_SITE)/$(FOO_SOURCE)
-    <a name="line15" id="line15">15</a>
-    <a name="line16" id="line16">16</a>  $(FOO_DIR)/.source: $(DL_DIR)/$(FOO_SOURCE)
-    <a name="line17" id="line17">17</a>          $(ZCAT) $(DL_DIR)/$(FOO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-    <a name="line18" id="line18">18</a>          touch $@
-    <a name="line19" id="line19">19</a>
-    <a name="line20" id="line20">20</a>  $(FOO_DIR)/.configured: $(FOO_DIR)/.source
-    <a name="line21" id="line21">21</a>          (cd $(FOO_DIR); rm -rf config.cache; \
-    <a name="line22" id="line22">22</a>                  $(TARGET_CONFIGURE_OPTS) \
-    <a name="line23" id="line23">23</a>                  $(TARGET_CONFIGURE_ARGS) \
-    <a name="line24" id="line24">24</a>                  ./configure \
-    <a name="line25" id="line25">25</a>                  --target=$(GNU_TARGET_NAME) \
-    <a name="line26" id="line26">26</a>                  --host=$(GNU_TARGET_NAME) \
-    <a name="line27" id="line27">27</a>                  --build=$(GNU_HOST_NAME) \
-    <a name="line28" id="line28">28</a>                  --prefix=/usr \
-    <a name="line29" id="line29">29</a>                  --sysconfdir=/etc \
-    <a name="line30" id="line30">30</a>          )
-    <a name="line31" id="line31">31</a>          touch $@
-    <a name="line32" id="line32">32</a>
-    <a name="line33" id="line33">33</a>  $(FOO_DIR)/$(FOO_BINARY): $(FOO_DIR)/.configured
-    <a name="line34" id="line34">34</a>          $(MAKE) CC=$(TARGET_CC) -C $(FOO_DIR)
-    <a name="line35" id="line35">35</a>
-    <a name="line36" id="line36">36</a>  $(TARGET_DIR)/$(FOO_TARGET_BINARY): $(FOO_DIR)/$(FOO_BINARY)
-    <a name="line37" id="line37">37</a>          $(MAKE) prefix=$(TARGET_DIR)/usr -C $(FOO_DIR) install
-    <a name="line38" id="line38">38</a>          rm -Rf $(TARGET_DIR)/usr/man
-    <a name="line39" id="line39">39</a>
-    <a name="line40" id="line40">40</a>  foo: uclibc ncurses $(TARGET_DIR)/$(FOO_TARGET_BINARY)
-    <a name="line41" id="line41">41</a>
-    <a name="line42" id="line42">42</a>  foo-source: $(DL_DIR)/$(FOO_SOURCE)
-    <a name="line43" id="line43">43</a>
-    <a name="line44" id="line44">44</a>  foo-clean:
-    <a name="line45" id="line45">45</a>          $(MAKE) prefix=$(TARGET_DIR)/usr -C $(FOO_DIR) uninstall
-    <a name="line46" id="line46">46</a>          -$(MAKE) -C $(FOO_DIR) clean
-    <a name="line47" id="line47">47</a>
-    <a name="line48" id="line48">48</a>  foo-dirclean:
-    <a name="line49" id="line49">49</a>          rm -rf $(FOO_DIR)
-    <a name="line50" id="line50">50</a>
-    <a name="line51" id="line51">51</a> #############################################################
-    <a name="line52" id="line52">52</a> #
-    <a name="line53" id="line53">53</a> # Toplevel Makefile options
-    <a name="line54" id="line54">54</a> #
-    <a name="line55" id="line55">55</a> #############################################################
-    <a name="line56" id="line56">56</a> ifeq ($(BR2_PACKAGE_FOO),y)
-    <a name="line57" id="line57">57</a> TARGETS+=foo
-    <a name="line58" id="line58">58</a> endif
+     <a name="ex1line1" id="ex1line1">1</a>  #############################################################
+     <a name="ex1line2" id="ex1line2">2</a>  #
+     <a name="ex1line3" id="ex1line3">3</a>  # foo
+     <a name="ex1line4" id="ex1line4">4</a>  #
+     <a name="ex1line5" id="ex1line5">5</a>  #############################################################
+     <a name="ex1line6" id="ex1line6">6</a>  FOO_VERSION:=1.0
+     <a name="ex1line7" id="ex1line7">7</a>  FOO_SOURCE:=foo-$(FOO_VERSION).tar.gz
+     <a name="ex1line8" id="ex1line8">8</a>  FOO_SITE:=http://www.foosoftware.org/downloads
+     <a name="ex1line9" id="ex1line9">9</a>  FOO_INSTALL_STAGING = YES
+     <a name="ex1line10" id="ex1line10">10</a>  FOO_INSTALL_TARGET = YES
+     <a name="ex1line11" id="ex1line11">11</a>  FOO_CONF_OPT =  --enable-shared
+     <a name="ex1line12" id="ex1line12">12</a>  FOO_DEPENDENCIES = libglib2 pkgconfig
+     <a name="ex1line13" id="ex1line13">13</a>  $(eval $(call AUTOTARGETS,package,foo))
+</pre>
 
+    <p>On <a href="#ex1line6">line 6</a>, we declare the version of
+    the package. On line <a href="#ex1line7">7</a> and <a
+    href="#ex1line8">8</a>, we declare the name of the tarball and the
+    location of the tarball on the Web. Buildroot will automatically
+    download the tarball from this location.</p>
+
+    <p>On <a href="#ex1line9">line 9</a>, we tell Buildroot to install
+    the application to the staging directory. The staging directory,
+    located in <code>build_ARCH/staging_dir/</code> is the directory
+    where all the packages are installed, including their
+    documentation, etc. By default, packages are installed in this
+    location using the <code>make install</code> command.</p>
+
+    <p>On <a href="#ex1line10">line 10</a>, we tell Buildroot to also
+    install the application to the target directory. This directory
+    contains what will become the root filesystem running on the
+    target. Usually, we try not to install the documentation, and to
+    install stripped versions of the binary. By default, packages are
+    installed in this location using the <code>make
+    install-strip</code> command.</p>
+
+    <p>On <a href="#ex1line11">line 11</a>, we tell Buildroot to pass
+    a custom configure option, that will be passed to the
+    <code>./configure</code> script before configuring and building
+    the package.</p>
+
+    <p>On <a href="#ex1line12">line 12</a>, we declare our
+    dependencies, so that they are built before the build process of
+    our package starts.</p>
+
+    <p>Finally, on line <a href="#ex1line13">line 13</a>, we invoke
+    the <code>package/Makefile.autotools.in</code> magic to get things
+    working.</p>
+
+    <p>For more details about the available variables and options, see
+    the comment at the top of
+    <code>package/Makefile.autotools.in</code> and the examples in all
+    the available packages.</p>
+
+    <p>The second solution, suitable for every type of package, looks
+    like this&nbsp;:</p>
+
+
+<pre>
+     <a name="ex2line1" id="ex2line1">1</a>  #############################################################
+     <a name="ex2line2" id="ex2line2">2</a>  #
+     <a name="ex2line3" id="ex2line3">3</a>  # foo
+     <a name="ex2line4" id="ex2line4">4</a>  #
+     <a name="ex2line5" id="ex2line5">5</a>  #############################################################
+     <a name="ex2line6" id="ex2line6">6</a>  FOO_VERSION:=1.0
+     <a name="ex2line7" id="ex2line7">7</a>  FOO_SOURCE:=foo-$(FOO_VERSION).tar.gz
+     <a name="ex2line8" id="ex2line8">8</a>  FOO_SITE:=http://www.foosoftware.org/downloads
+     <a name="ex2line9" id="ex2line9">9</a>  FOO_DIR:=$(BUILD_DIR)/foo-$(FOO_VERSION)
+    <a name="ex2line10" id="ex2line10">10</a>  FOO_BINARY:=foo
+    <a name="ex2line11" id="ex2line11">11</a>  FOO_TARGET_BINARY:=usr/bin/foo
+    <a name="ex2line12" id="ex2line12">12</a>
+    <a name="ex2line13" id="ex2line13">13</a>  $(DL_DIR)/$(FOO_SOURCE):
+    <a name="ex2line14" id="ex2line14">14</a>          $(WGET) -P $(DL_DIR) $(FOO_SITE)/$(FOO_SOURCE)
+    <a name="ex2line15" id="ex2line15">15</a>
+    <a name="ex2line16" id="ex2line16">16</a>  $(FOO_DIR)/.source: $(DL_DIR)/$(FOO_SOURCE)
+    <a name="ex2line17" id="ex2line17">17</a>          $(ZCAT) $(DL_DIR)/$(FOO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+    <a name="ex2line18" id="ex2line18">18</a>          touch $@
+    <a name="ex2line19" id="ex2line19">19</a>
+    <a name="ex2line20" id="ex2line20">20</a>  $(FOO_DIR)/.configured: $(FOO_DIR)/.source
+    <a name="ex2line21" id="ex2line21">21</a>          (cd $(FOO_DIR); rm -rf config.cache; \
+    <a name="ex2line22" id="ex2line22">22</a>                  $(TARGET_CONFIGURE_OPTS) \
+    <a name="ex2line23" id="ex2line23">23</a>                  $(TARGET_CONFIGURE_ARGS) \
+    <a name="ex2line24" id="ex2line24">24</a>                  ./configure \
+    <a name="ex2line25" id="ex2line25">25</a>                  --target=$(GNU_TARGET_NAME) \
+    <a name="ex2line26" id="ex2line26">26</a>                  --host=$(GNU_TARGET_NAME) \
+    <a name="ex2line27" id="ex2line27">27</a>                  --build=$(GNU_HOST_NAME) \
+    <a name="ex2line28" id="ex2line28">28</a>                  --prefix=/usr \
+    <a name="ex2line29" id="ex2line29">29</a>                  --sysconfdir=/etc \
+    <a name="ex2line30" id="ex2line30">30</a>          )
+    <a name="ex2line31" id="ex2line31">31</a>          touch $@
+    <a name="ex2line32" id="ex2line32">32</a>
+    <a name="ex2line33" id="ex2line33">33</a>  $(FOO_DIR)/$(FOO_BINARY): $(FOO_DIR)/.configured
+    <a name="ex2line34" id="ex2line34">34</a>          $(MAKE) CC=$(TARGET_CC) -C $(FOO_DIR)
+    <a name="ex2line35" id="ex2line35">35</a>
+    <a name="ex2line36" id="ex2line36">36</a>  $(TARGET_DIR)/$(FOO_TARGET_BINARY): $(FOO_DIR)/$(FOO_BINARY)
+    <a name="ex2line37" id="ex2line37">37</a>          $(MAKE) prefix=$(TARGET_DIR)/usr -C $(FOO_DIR) install
+    <a name="ex2line38" id="ex2line38">38</a>          rm -Rf $(TARGET_DIR)/usr/man
+    <a name="ex2line39" id="ex2line39">39</a>
+    <a name="ex2line40" id="ex2line40">40</a>  foo: uclibc ncurses $(TARGET_DIR)/$(FOO_TARGET_BINARY)
+    <a name="ex2line41" id="ex2line41">41</a>
+    <a name="ex2line42" id="ex2line42">42</a>  foo-source: $(DL_DIR)/$(FOO_SOURCE)
+    <a name="ex2line43" id="ex2line43">43</a>
+    <a name="ex2line44" id="ex2line44">44</a>  foo-clean:
+    <a name="ex2line45" id="ex2line45">45</a>          $(MAKE) prefix=$(TARGET_DIR)/usr -C $(FOO_DIR) uninstall
+    <a name="ex2line46" id="ex2line46">46</a>          -$(MAKE) -C $(FOO_DIR) clean
+    <a name="ex2line47" id="ex2line47">47</a>
+    <a name="ex2line48" id="ex2line48">48</a>  foo-dirclean:
+    <a name="ex2line49" id="ex2line49">49</a>          rm -rf $(FOO_DIR)
+    <a name="ex2line50" id="ex2line50">50</a>
+    <a name="ex2line51" id="ex2line51">51</a> #############################################################
+    <a name="ex2line52" id="ex2line52">52</a> #
+    <a name="ex2line53" id="ex2line53">53</a> # Toplevel Makefile options
+    <a name="ex2line54" id="ex2line54">54</a> #
+    <a name="ex2line55" id="ex2line55">55</a> #############################################################
+    <a name="ex2line56" id="ex2line56">56</a> ifeq ($(BR2_PACKAGE_FOO),y)
+    <a name="ex2line57" id="ex2line57">57</a> TARGETS+=foo
+    <a name="ex2line58" id="ex2line58">58</a> endif
+
 </pre>
 
     <p>First of all, this <i>Makefile</i> example works for a single
@@ -977,7 +1048,7 @@
     the other <code>*.mk</code> files in the <code>package</code>
     directory. </p>
 
-    <p>At lines <a href="#line6">6-11</a>, a couple of useful variables are 
+    <p>At lines <a href="#ex2line6">6-11</a>, a couple of useful variables are 
     defined :</p>
 
     <ul>
@@ -1007,21 +1078,21 @@
 
     </ul>
 
-    <p>Lines <a href="#line13">13-14</a> defines a target that downloads the 
+    <p>Lines <a href="#ex2line13">13-14</a> defines a target that downloads the 
     tarball from the remote site to the download directory
     (<code>DL_DIR</code>). </p>
 
-    <p>Lines <a href="#line16">16-18</a> defines a target and associated rules 
+    <p>Lines <a href="#ex2line16">16-18</a> defines a target and associated rules 
     that uncompress the downloaded tarball. As you can see, this target
     depends on the tarball file, so that the previous target (line
-    <a href="#line13">13-14</a>) is called before executing the rules of the 
+    <a href="#ex2line13">13-14</a>) is called before executing the rules of the 
     current target. Uncompressing is followed by <i>touching</i> a hidden file
     to mark the software has having been uncompressed. This trick is
     used everywhere in Buildroot <i>Makefile</i> to split steps
     (download, uncompress, configure, compile, install) while still
     having correct dependencies. </p>
 
-    <p>Lines <a href="#line20">20-31</a> defines a target and associated rules 
+    <p>Lines <a href="#ex2line20">20-31</a> defines a target and associated rules 
     that configures the software. It depends on the previous target (the
     hidden <code>.source</code> file) so that we are sure the software has
     been uncompressed. In order to configure it, it basically runs the
@@ -1033,14 +1104,14 @@
     filesystem. Finally it creates a <code>.configured</code> file to
     mark the software as configured. </p>
 
-    <p>Lines <a href="#line33">33-34</a> defines a target and a rule that 
+    <p>Lines <a href="#ex2line33">33-34</a> defines a target and a rule that 
     compiles the software. This target will create the binary file in the
     compilation directory, and depends on the software being already
     configured (hence the reference to the <code>.configured</code>
     file). It basically runs <code>make</code> inside the source
     directory. </p>
 
-    <p>Lines <a href="#line36">36-38</a> defines a target and associated rules 
+    <p>Lines <a href="#ex2line36">36-38</a> defines a target and associated rules 
     that install the software inside the target filesystem. It depends on the
     binary file in the source directory, to make sure the software has
     been compiled. It uses the <code>install</code> target of the
@@ -1051,7 +1122,7 @@
     <code>/usr/man</code> directory inside the target filesystem is
     removed to save space. </p>
 
-    <p>Line <a href="#line40">40</a> defines the main target of the software, 
+    <p>Line <a href="#ex2line40">40</a> defines the main target of the software, 
     the one that will be eventually be used by the top level
     <code>Makefile</code> to download, compile, and then install
     this package. This target should first of all depends on all
@@ -1060,7 +1131,7 @@
     final binary. This last dependency will call all previous
     dependencies in the correct order. </p>
 
-    <p>Line <a href="#line42">42</a> defines a simple target that only 
+    <p>Line <a href="#ex2line42">42</a> defines a simple target that only 
     downloads the code source. This is not used during normal operation of 
     Buildroot, but is needed if you intend to download all required sources at 
     once for later offline build. Note that if you add a new package providing
@@ -1068,25 +1139,25 @@
     users that wish to do offline-builds. Furthermore it eases checking
     if all package-sources are downloadable. </p>
 
-    <p>Lines <a href="#line44">44-46</a> define a simple target to clean the 
+    <p>Lines <a href="#ex2line44">44-46</a> define a simple target to clean the 
     software build by calling the <i>Makefiles</i> with the appropriate option.
     The <code>-clean</code> target should run <code>make clean</code>
     on $(BUILD_DIR)/package-version and MUST uninstall all files of the
     package from $(STAGING_DIR) and from $(TARGET_DIR). </p>
 
-    <p>Lines <a href="#line48">48-49</a> define a simple target to completely 
+    <p>Lines <a href="#ex2line48">48-49</a> define a simple target to completely 
     remove the directory in which the software was uncompressed, configured and
     compiled. The <code>-dirclean</code> target MUST completely rm $(BUILD_DIR)/
     package-version. </p>
 
-    <p>Lines <a href="#line51">51-58</a> adds the target <code>foo</code> to 
+    <p>Lines <a href="#ex2line51">51-58</a> adds the target <code>foo</code> to 
     the list of targets to be compiled by Buildroot by first checking if
     the configuration option for this package has been enabled
     using the configuration tool, and if so then &quot;subscribes&quot;
     this package to be compiled by adding it to the TARGETS
     global variable.  The name added to the TARGETS global
     variable is the name of this package's target, as defined on
-    line <a href="#line40">40</a>, which is used by Buildroot to download, 
+    line <a href="#ex2line40">40</a>, which is used by Buildroot to download, 
     compile, and then install this package. </p>
 
 
