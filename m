From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Oct 2015 21:17:27 +0300
Subject: [Buildroot] ltp-testsuite without native RPC (commit
 8f1c4c49a2ab0fc9e6cf73370f4483e253e5ac2d)
In-Reply-To: <CAAXf6LUBj47OW0+VBzeYE-Zh3jLMg77-kWCOiSCMPGiRKKSPfw@mail.gmail.com>
References: <CAAXf6LUBj47OW0+VBzeYE-Zh3jLMg77-kWCOiSCMPGiRKKSPfw@mail.gmail.com>
Message-ID: <20151015181727.GI2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Oct 15, 2015 at 04:06:39PM +0200, Thomas De Schampheleire wrote:
> I only now saw your commit 8f1c4c49a2ab0fc9e6cf73370f4483e253e5ac2d
> that disables again building ltp-testsuite without a native-RPC
> toolchain. Using commit baedef979cda7783b399099b49cd23536e44b1c7 I had
> added that support.

I saw your commit, so I put you on the Cc of commit 8f1c4c49a2a.

> First of all, it looks to me that the patch is incomplete: the
> Config.in file still allows selecting ltp-testsuite without RPC
> support, and selects libtirpc in that case. While I haven't tried it
> again, I think this will break compilation for these cases.

I don't think so. Commit 8f1c4c49a2a adds ac_cv_header_tirpc_netconfig_h=no to 
_CONF_ENV to avoid link with the standalone libtirpc even when it's installed.

But you are right that selecting BR2_PACKAGE_LIBTIRPC now makes no sense. Just 
sent a patch removing it.

> But more to the core of the problem: I wonder if disabling the entire
> ltp-testsuite here is the right approach. The RPC support is only
> needed for the small amount of network tests that use RPC. The ltp
> testsuite as a whole is much broader than that. By disabling
> ltp-testsuite entirely the users without native rpc toolchain are thus
> 'punished' unnecessarily hard.

I'm not sure I follow. In what case does commit 8f1c4c49a2a disable 
ltp-testsuite?

> What about patching ltp-testsuite instead, not enabling the RPC tests
> in this case? At first sight this was added with following (ltp)
> commit:
> https://github.com/linux-test-project/ltp/commit/8e9a4dbb8eaa561e51d6d8ebe5a5342f3e498224

Isn't that what ac_cv_header_tirpc_netconfig_h=no is doing?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
