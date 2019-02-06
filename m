From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 14:10:21 +0100
Subject: [Buildroot] [RFC PATCH 1/1] package/googlefontdirectory: change
 to google repo
In-Reply-To: <20190117211422.14576-1-b.bilas@grinn-global.com>
References: <20190117211422.14576-1-b.bilas@grinn-global.com>
Message-ID: <20190206141021.43b95bdb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Jan 2019 22:14:22 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> As because the current repository doesn't support new fonts
> we need to change it to the new one official google github repository
> which contains a lot of new available fonts.
> 
> Note: There are some things to improve like license files
> because in the new repository every directory with font
> contains separate license file however I have no idea
> how to do it in proper way.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  .../googlefontdirectory.hash                  |  2 +-
>  .../googlefontdirectory.mk                    | 23 +++++++++++--------
>  2 files changed, 15 insertions(+), 10 deletions(-)

So, I've applied, but after doing a fair number of changes.

First, I've changed the semantic of the
BR2_PACKAGE_GOOGLEFONTDIRECTORY_FONTS so that the value it contains
look like ufl/ubuntu, ofl/marvel, etc. rather than just the font name.

Thanks to that, the installation logic could be simplified, and I could
come up with a solution for the LICENSE and LICENSE_FILES variables.
The solution looks like this:

+ifneq ($(filter apache/%,$(GOOGLEFONTDIRECTORY_FONTS)),)
+GOOGLEFONTDIRECTORY_LICENSE += Apache-2.0
+GOOGLEFONTDIRECTORY_LICENSE_FILES += $(addsuffix /LICENSE.txt,$(filter apache/%,$(GOOGLEFONTDIRECTORY_FONTS)))
+endif
+
+ifneq ($(filter ofl/%,$(GOOGLEFONTDIRECTORY_FONTS)),)
+GOOGLEFONTDIRECTORY_LICENSE += OFL-1.1
+GOOGLEFONTDIRECTORY_LICENSE_FILES += $(addsuffix /OFL.txt,$(filter ofl/%,$(GOOGLEFONTDIRECTORY_FONTS)))
+endif
+
+ifneq ($(filter ufl/%,$(GOOGLEFONTDIRECTORY_FONTS)),)
+GOOGLEFONTDIRECTORY_LICENSE += UFL-1.1
+GOOGLEFONTDIRECTORY_LICENSE_FILES += $(addsuffix /LICENCE.txt,$(filter ufl/%,$(GOOGLEFONTDIRECTORY_FONTS)))
+endif
+
+GOOGLEFONTDIRECTORY_LICENSE := $(subst $(space),$(comma)$(space),$(GOOGLEFONTDIRECTORY_LICENSE))

It's a bit tricky, but it works :-)

I've also changed the .hash file to contain the hashes of all the
license files.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
