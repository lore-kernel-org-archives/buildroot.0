From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 24 Jul 2011 13:54:15 +0200
Subject: [Buildroot] [PATCH 2 of 3] Allow BR2_PRIMARY_SITE and
 BR2_BACKUP_SITE to be a file:// URL
In-Reply-To: <20110720071336.1958f634@skate>
References: <patchbomb.1300174025@localhost6.localdomain6>
 <0aa192a871d0b6d66c57.1300174027@localhost6.localdomain6>
 <20110720071336.1958f634@skate>
Message-ID: <CAAXf6LXixYABXkp_LP+9kcUSp1cCMfcOKcYqBxMNzcu-dm2N=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 20, 2011 at 7:13 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Tue, 15 Mar 2011 08:27:07 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> ?define DOWNLOAD
>> ? ? ? $(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
>> - ? ? ? ? ? ? $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
>> + ? ? ? ? ? ? case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
>> + ? ? ? ? ? ? ? ? ? ? file) $(call $(DL_MODE)_FILE,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
>> + ? ? ? ? ? ? ? ? ? ? *) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
>> + ? ? ? ? ? ? esac ; \
>
> Does this bring any additional feature that using the existing
> BR2_DL_DIR option ?

I don't think that BR2_DL_DIR and BR2_PRIMARY_SITE serve the same
purpose. The former specifies where packages should be stored, which
implies write permissions. The latter specifies where packages come
from, which only implies read permissions. In a project with multiple
developers, one wouldn't want the central 'DL_DIR' to become cluttered
with packages from each individual developer's experiments.

Moreover, the current uses of DL_DIR expect it to be a locally
accessible directory. In order to support scp, we'd need to modify all
the existing download rules.
