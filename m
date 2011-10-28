From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 28 Oct 2011 10:12:10 +0200
Subject: [Buildroot] [PATCH] Packages: download via NFS/Samba
In-Reply-To: <CA+hj=Mqvu7kee4urAHL3LyEi+oc4+wgEOFF=MTSAsFOw+whDdA@mail.gmail.com>
References: <CA+hj=Mo42CvZQYWApH6sk0Q5E8NF2N3bnpNUCTqK5QaxrUJo+A@mail.gmail.com>
 <CAAXf6LUzq5ERKcitCJK3LFHeDeVS9s=edO_MtPA2fxbZ_gi21g@mail.gmail.com>
 <CA+hj=Mqvu7kee4urAHL3LyEi+oc4+wgEOFF=MTSAsFOw+whDdA@mail.gmail.com>
Message-ID: <CAAXf6LWPP2n6xn_+x2pxD8P1gLut1ONYoQGMYkqaLVZVH7VF-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ivan,
(sending to the list now)

On Fri, Oct 28, 2011 at 9:12 AM, Ivan Wagner <ivan.wagner@gmail.com> wrote:
>> In which way is this different from the existing LOCALFILES download method?
>> Moreover, I think the name NFS is too restrictive (as you indicate it
>> can be used for Samba, or even a plain local file)
>
> Well you cannot specify a file:// schema on BR2_PRIMARY_SITE. It will
> choose wget by default and will therefore return the "Unsupported
> schema" error. This means you cannot specify LOCALFILES on a global
> basis. LOCALFILES works only on a per-package basis (by setting
> $(PKG)_SITE_METHOD = file and by changing the $(PKG)_SITE with a
> file:// schema).

It's true that the current check for BR2_PRIMARY_SITE does not allow
file:// URLs properly, but I don't think you need to add an extra
download method to fix that.

In my scp patch, I handled it as follows:

      $(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
-               $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
+               case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
+                       scp) $(call
$(DL_MODE)_SCP,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
+                       *) $(call
$(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
+               esac ; \
      fi ; \

I think that the following should work in your scenario:

      $(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
-               $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
+               case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
+                       scp) $(call
$(DL_MODE)_SCP,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
+                       file) $(call
$(DL_MODE)_LOCALFILES,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
+                       *) $(call
$(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
+               esac ; \
      fi ; \

Here, the existing localfiles method is re-used if the primary site
starts with file://.

Back in March, I proposed a set of patches that does exactly what you
do now. At the time, there was no LOCALFILES method yet. But, these
patches never got merged, and I moved to scp instead of file URLs.
http://lists.busybox.net/pipermail/buildroot/2011-March/041993.html
http://lists.busybox.net/pipermail/buildroot/2011-March/041994.html
http://lists.busybox.net/pipermail/buildroot/2011-March/041995.html
http://lists.busybox.net/pipermail/buildroot/2011-March/041996.html

>
>> I have two patches waiting for being merged, that add support for scp
>> (secure-copy, copy over SSH) and Mercurial downloads. The scp patch
>> also allows the BR2_PRIMARY_SITE to be an scp-URI. I also added
>> functions like 'stripurischeme', 'geturischeme' that abstracts the
>> qstrip/subst patterns.
>> I think the addition of LOCALFILES/NFS to BR2_PRIMARY_SITE should be
>> based upon that patch.
>>
>> http://lists.busybox.net/pipermail/buildroot/2011-October/047041.html
>> http://lists.busybox.net/pipermail/buildroot/2011-October/047042.html
>> http://lists.busybox.net/pipermail/buildroot/2011-October/047043.html
>>
>> Best regards,
>> Thomas
>>
>
> Great for your patches I hope they will be applied as soon as possible!

Thanks, I hope so too.

Best regards,
Thomas
