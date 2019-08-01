From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 17:52:30 +0200
Subject: [Buildroot] Harfbuzz issues
Message-ID: <20190801175230.35ea7b31@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, James,

Since Harfbuzz was bumped to 2.5.2 in commit
c04e5cb16e3de688dfee585f47f22db4232acb3e, we have a problem: harfbuzz
now requires gcc 4.8, so we need to add this dependency, for both the
target variant and the host variant of harfbuzz.

I had a look at the reverse dependency trees. First for the target
variant, it looks like this:

 - harfbuzz
   - pango
     - gst-plugins-base
     - gst1-plugins-base
     - pangomm
       - gtkmm3
     - libgtk2
       - about 6-7 packages
     - libgtk3
       - about 2-3 packages
     - openbox
     - rrdtool
   - qt5base
   - webkitgtk
     - midori
   - wpebkit

So all those packages need to gain BR2_TOOLCHAIN_HAS_GCC_AT_LEAST_4_8
dependency.

Then, the host variant of harfbuzz also needs gcc 4.8, the reverse
dependency tree looks like this:

 - host-harfbuzz
   - host-pango
     - host-librsvg
       - host-libgtk3
         - libgtk3
           - 2-3 packages
     - host-imagemagick, and its SVG sub-options

So libgtk3, the 2-3 packages that select libgtk3, and the host
imagemagick svg option need to gain a BR2_HOST_GCC_AT_LEAST_4_8
dependency.

Could you send a patch that implements this, with the appropriate
Config.in comment for target packages, and double checking that all
reverse dependencies have been taken care of ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
