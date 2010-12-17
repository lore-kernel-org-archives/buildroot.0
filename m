From: Sonic Zhang <sonic.adi@gmail.com>
Date: Fri, 17 Dec 2010 10:52:21 +0800
Subject: [Buildroot] [PATCH v2] buildroot:download: Add option to
 download SVN or GIT repository with version control information.
In-Reply-To: <1292534560.15771.21.camel@coalu.atr>
References: <1292492992-15797-1-git-send-email-sonic.adi@gmail.com>
	<1292534560.15771.21.camel@coalu.atr>
Message-ID: <AANLkTi=ouPyZhNpUYtXiesqVNt0WSiNyp57PW+n-U_ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 17, 2010 at 5:22 AM, Lionel Landwerlin
<llandwerlin@gmail.com> wrote:
> Hello Sonic,
>
> I'm very pleased to see this BR2_CHECKOUT_SOURCE_FOR_DEV option. But I
> have a slight point to make, why make a tarball of the checkout tree ?
> It seems quite slow to me, because it stores the source code twice (once
> in the .svn/.git directory, and once in the working tree).
>

I just avoid changes to buildroot building process in this patch. I
can take a look.

> I've the attached patch which only makes the checkout and do not
> generate a tarball (but it might be frustrating when you're offline
> after a <pkg>-dirclean...).
>
> Wouldn't it be possible to find a solution to just store .svn/.git
> directories and trigger a git-checkout -f $(BRANCH)/svn update --force
> after extraction?
>
> Best regards,
>
> --
> Lionel Landwerlin
>
> Le jeudi 16 d?cembre 2010 ? 17:49 +0800, Sonic Zhang a ?crit :
>> Current DOWNLOAD_SVN and DOWNLOAD_GIT scripts only retrieve source code of a
>> given version from the repository. It is more complicated to generate patches
>> against the source after fixing bugs and developing in buildroot directly.
>> This patch adds an option BR2_CHECKOUT_SOURCE_FOR_DEVELOPMENT to checkout the
>> source with version control information. This option is disabled by default.
>>
>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>> ---
>> ?Config.in ? ? ? ? ? ? ? ? ? | ? ?7 +++++++
>> ?package/Makefile.package.in | ? 20 ++++++++++++++++----
>> ?2 files changed, 23 insertions(+), 4 deletions(-)
>>
>> diff --git a/Config.in b/Config.in
>> index c90de77..7fa2aba 100644
>> --- a/Config.in
>> +++ b/Config.in
>> @@ -154,6 +154,13 @@ config BR2_DEBUG_MUDFLAP
>> ? ? ? ? Your GCC must be new enough to support this option.
>> ?endif
>>
>> +config BR2_CHECKOUT_SOURCE_FOR_DEVELOPMENT
>> + ? ? bool "check out source with git or svn revision information"
>> + ? ? default n
>> + ? ? help
>> + ? ? ? If y, check out the source from git or svn repository with
>> + ? ? ? revision information and store in the source tar ball.
>> +
>> ?choice
>> ? ? ? prompt "strip"
>> ? ? ? default BR2_STRIP_strip
>> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
>> index 9f876b9..78b2cda 100644
>> --- a/package/Makefile.package.in
>> +++ b/package/Makefile.package.in
>> @@ -100,15 +100,22 @@ endif
>> ?# source repositories, producing a list of all the "external dependencies" of
>> ?# a given build configuration.
>> ?################################################################################
>> -
>> ?define DOWNLOAD_GIT
>> + ? ? if [ "$(BR2_CHECKOUT_SOURCE_FOR_DEVELOPMENT)" = "y" ] ; then \
>> + ? ? ? ? ? ? GITCMD="$(GIT) checkout -b $($(PKG)_BRANCH) $($(PKG)_DL_VERSION)" ; \
>> + ? ? ? ? ? ? TARCMD="$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/" ; \
>> + ? ? else \
>> + ? ? ? ? ? ? GITCMD="$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
>> + ? ? ? ? ? ? ? ? ? ? gzip -c > $(DL_DIR)/$($(PKG)_SOURCE)" ; \
>> + ? ? ? ? ? ? TARCMD=test ; \
>> + ? ? fi ; \
>> ? ? ? test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
>> ? ? ? (pushd $(DL_DIR) > /dev/null && \
>> ? ? ? $(GIT) clone $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
>> ? ? ? pushd $($(PKG)_BASE_NAME) > /dev/null && \
>> - ? ? $(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
>> - ? ? ? ? ? ? gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
>> + ? ? eval $$GITCMD && \
>> ? ? ? popd > /dev/null && \
>> + ? ? eval $$TARCMD && \
>> ? ? ? rm -rf $($(PKG)_DL_DIR) && \
>> ? ? ? popd > /dev/null)
>> ?endef
>> @@ -125,9 +132,14 @@ endef
>>
>>
>> ?define DOWNLOAD_SVN
>> + ? ? if [ "$(BR2_CHECKOUT_SOURCE_FOR_DEVELOPMENT)" = "y" ] ; then \
>> + ? ? ? ? ? ? SVNCMD=checkout ; \
>> + ? ? else \
>> + ? ? ? ? ? ? SVNCMD=export ; \
>> + ? ? fi ; \
>> ? ? ? test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
>> ? ? ? (pushd $(DL_DIR) > /dev/null && \
>> - ? ? $(SVN) export -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
>> + ? ? $(SVN) $$SVNCMD -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
>> ? ? ? $(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
>> ? ? ? rm -rf $($(PKG)_DL_DIR) && \
>> ? ? ? popd > /dev/null)
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
