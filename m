From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Jul 2015 15:45:19 +0200
Subject: [Buildroot] [PATCH 1/1] yad: new package
In-Reply-To: <20150703094910.750481b4@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 3 Jul 2015 09:49:10 +0200")
References: <1435874967-6416-1-git-send-email-james.knight@rockwellcollins.com>
 <20150703053105.GL2391@tarshish>
 <20150703094910.750481b4@free-electrons.com>
Message-ID: <871tgpxsls.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > +
 >> > +if BR2_PACKAGE_YAD
 >> > +
 >> > +config BR2_PACKAGE_YAD_FORCE_LIBGTK2
 >> > +	bool "Force libgtk2"
 >> > +	depends on BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_LIBGTK3
 >> 
 >> You need both gtk2 and gtk3?

 > No, I think James idea here is that if the user has gtk2 *or* gtk3
 > enabled, then we don't need anything special: we'll use either of them.

 > However, if the user has enabled *both* gtk2 and gtk3, then we need to
 > know which one the user wants to use. This option therefore appears in
 > such a situation, and allows the user to either opt for gtk3 (option
 > disabled) or gtk2 (option enabled).

Ok, but that really a common enough situation to add such an option?
E.G. how often do people have a config where:

- They have enabled BOTH gtk2 and gtk3
- They are not happy with yad using gtk3

E.G. the Debian package simply uses the gtk3 backend.

If we really want to do it then I think it would be clearer to have
a choice option, E.G.:

choice
        prompt "backend to use" if BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_LIBGTK3

config BR2_PACKAGE_YAD_GTK3
       depends on BR2_PACKAGE_LIBGTK3
       prompt "gtk3"

config BR2_PACKAGE_YAD_GTK2
       depends on BR2_PACKAGE_LIBGTK2
       prompt "gtk2"

endchoice

 >> > +ifeq ($(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_YAD_FORCE_LIBGTK2),y)
 >> 
 >> This condition is true if either gtk3 or gtk2 are selected...

 > No, this condition is true if gtk3 is there *and*
 > BR2_PACKAGE_YAD_FORCE_LIBGTK2 is disabled, which means that we want to
 > use gtk3, because we are in one of the two possible situations:

 >  * only gtk3 is enabled -> we want to use it

 >  * both gtk3 and gtk2 are enabled, but since
 >    BR2_PACKAGE_YAD_FORCE_LIBGTK2 is enabled, it means the user wants to
 >    use gtk3

For those situations where we want to check for A and !B we often stick
a dummy character like 'x' in between to make it clearer - E.G.

ifeq ($(BR2_PACKAGE_LIBGTK3)x$(BR2_PACKAGE_YAD_FORCE_LIBGTK2),yx)

git grep ,yx
package/cairo/cairo.mk:ifeq ($(BR2_PACKAGE_DIRECTFB)x$(BR2_PACKAGE_DIRECTFB_SVG),yx)
package/ffmpeg/ffmpeg.mk:ifeq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
package/ipmiutil/ipmiutil.mk:ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
package/iproute2/iproute2.mk:ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
package/libsrtp/libsrtp.mk:ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)

A comment explaining this would also be good.


 > and then use gtk3 if available, otherwise gtk2 if available. Thanks to
 > the select, you're sure at least one of the two will be available. The
 > only thing you give up is that the user cannot select to use gtk2 if he
 > has both gtk2 and gtk3 in the same system. But:

 > 	1/ situations with both gtk2 and gtk3 are pretty unlikely

 > 	2/ if you have both, why would you *not* want to use gtk3 ?

Indeed.

-- 
Bye, Peter Korsgaard
