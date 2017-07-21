From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Fri, 21 Jul 2017 13:55:44 -0700
Subject: [Buildroot] [PATCH] package/qt5location: handle plugins being
 conditionally built
In-Reply-To: <20170721082639.2c98c0fb@windsurf>
References: <1500593609-5610-1-git-send-email-joshua.henderson@microchip.com>
 <20170721082639.2c98c0fb@windsurf>
Message-ID: <d8101825-eb91-6f16-2add-2e6f281cbd67@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 07/20/2017 11:26 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 20 Jul 2017 16:33:29 -0700, Joshua Henderson wrote:
>> This fixes a build issue where the qt5location plugins are not built, but are
>> attempted to be installed.
>>
>> The qt5location plugins have dependencies that are automatically resolved
>> causing plugins to conditionaly be built. This change checks for the existance
>> of the plugins prior to trying to install them.
> 
> Thanks for the fix. Do you know under which condition the plugins will
> be built vs. not built ?
> 

See my reply to Peter on this issue and v2 of this patch.  This is not the right fix.
It appears that qtlocation improperly has a dependency on the quick module in order to
establish build dependencies for the plugin in question.  It is probably better to hit
this issue head on instead of just making buildroot install whatever is built.

> If it's related to one or several dependencies being available, then I
> would prefer something like:
> 
> ifeq ($(BR2...dependencies needed for plugins),y)
> define QT5LOCATION_INSTALL_PLUGINS
> 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/position $(TARGET_DIR)/usr/lib/qt/plugins/
> endef
> endif
> 
> define QT5LOCATION_INSTALL_TARGET_POSITION
> 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Positioning.so.* $(TARGET_DIR)/usr/lib
> 	$(QT5LOCATION_INSTALL_PLUGINS)
> endef
> 

Good to know.  I actually looked into doing this, but then I started questioning having
dependency tracking of this sort in both buildroot and the application itself.

Food for thought on this topic of copying installed files from staging to target.  Why
not abstract it out and simply provide a list of files and directories to a single
package variable that would handle this automatically?  It won't work for every case,
but it seems like it would work most of the time and be a bit simpler to create and
clearer to read what is being installed.

Josh
