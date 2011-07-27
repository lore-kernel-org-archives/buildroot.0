From: Cory Fields <FOSS@AtlasTechnologiesInc.com>
Date: Wed, 27 Jul 2011 06:09:17 +0000
Subject: [Buildroot] [PATCH] fetch/git: Allow fetching from git using ssh
In-Reply-To: <CAAXf6LUkFuFCoG-q-5XZYb813uGSQDbNJfspB8Mv=z3axdChhQ@mail.gmail.com>
References: <CAApLimjwecWdVKWC1qMWc64_5Syn0QrjdA2SPUZXPxMvd+UtVQ@mail.gmail.com>
 <CAAXf6LUkFuFCoG-q-5XZYb813uGSQDbNJfspB8Mv=z3axdChhQ@mail.gmail.com>
Message-ID: <CAApLimhPUHDv7HXx3H5GnkFddZrzA9971mmP=8nXRhNsa6sO=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 27, 2011 at 5:58 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi Cory,
>
> On Tue, Jul 26, 2011 at 9:17 PM, Cory Fields
> <FOSS@atlastechnologiesinc.com> wrote:
>> My apologies for not doing a proper git-send-email, my git install is
>> somewhat broken at the moment. See attached.
>>
>> The patch is against the 2011.02 branch, but it's very simple and
>> should be easy enough to apply to master.
>
> Copying here for convenience:
>
>> [PATCH] fetch/git: Allow fetching from git using ssh://
>>
>> This is especially useful for private repositories. For example,
>> github allows fetching from ssh:// git:// and https://. However, for
>> private repos (due to the need to authenticate) only https and ssh are
>> allowed. The protocol is transparent as far as git is concerned. For
>> now, just assume any ssh:// URI is a git repository. Since we would
>> just fallback to wget anyway, this should be a safe assumption
>
> I don't think this is a safe assumption. Also other version control
> systems allow ssh URLs, at least Mercurial does. By hardcoding ssh ->
> git, you break these other version control systems.

Well, my logic was that ssh falls through to wget, it wouldn't make
things worse for any others, only better for git.

>
> But why do you need this patch at all?
> If you explicitly specify <PACKAGE>_SITE_METHOD to git, you can pass
> in an ssh url without problem.
>
> Have you tried that?

No I didn't, but it makes perfect sense now. This is clearly the
correct answer. Perhaps some documentation would help, as it is
becoming quite common to grab a release from a tagged repo rather than
tarballs these days.

Thank you for the help, and quick response. Disregard patch.

Regards,
Cory

>
>>
>> Signed-off-by: Cory Fields <foss@atlastechnologiesinc.com>
>> ---
>> ?package/Makefile.package.in | ? ?4 +++-
>> ?1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
>> index 92ce4e2..1936786 100644
>> --- a/package/Makefile.package.in
>> +++ b/package/Makefile.package.in
>> @@ -189,7 +189,7 @@ define DOWNLOAD
>> ? ? ? fi ; \
>> ? ? ? if test -n "$(1)" ; then \
>> ? ? ? ? ? ? ? case "$($(PKG)_SITE_METHOD)" in \
>> - ? ? ? ? ? ? ? ? ? ? git) $($(DL_MODE)_GIT) && exit ;; \
>> + ? ? ? ? ? ? ? ? ? ? git | ssh) $($(DL_MODE)_GIT) && exit ;; \
>> ? ? ? ? ? ? ? ? ? ? ? svn) $($(DL_MODE)_SVN) && exit ;; \
>> ? ? ? ? ? ? ? ? ? ? ? bzr) $($(DL_MODE)_BZR) && exit ;; \
>> ? ? ? ? ? ? ? ? ? ? ? *) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
>> @@ -511,6 +511,8 @@ ifeq ($$($(2)_SITE_METHOD),svn)
>> ?DL_TOOLS_DEPENDENCIES += svn
>> ?else ifeq ($$($(2)_SITE_METHOD),git)
>> ?DL_TOOLS_DEPENDENCIES += git
>> +else ifeq ($$($(2)_SITE_METHOD),ssh)
>> +DL_TOOLS_DEPENDENCIES += git
>> ?else ifeq ($$($(2)_SITE_METHOD),bzr)
>> ?DL_TOOLS_DEPENDENCIES += bzr
>> ?endif # SITE_METHOD
>> --
>> 1.7.3.4
>
> Best regards,
> Thomas
>
