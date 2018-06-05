From: =?UTF-8?Q?Refik_Tuzakl=c4=b1?= <refik.tuzakli@savronik.com.tr>
Date: Tue, 5 Jun 2018 11:20:57 +0300
Subject: [Buildroot] [BALENA PATCH] balena : New Package
In-Reply-To: <20180604165507.4df4e009@windsurf>
References: <3551d854-8b04-370c-27ca-53394858a921@savronik.com.tr>
 <20180604165507.4df4e009@windsurf>
Message-ID: <13335b5c-0ab9-c990-ce0a-9a09661335ec@savronik.com.tr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks for feedback.

On 04-06-2018 17:55, Thomas Petazzoni wrote:
> Hello Refik,
>
> Thanks a lot for your contribution! I believe it's your first Buildroot
> contribution, so congratulations :-)
>
> The first comment is that you should sent your patch using "git
> send-email". Because you didn't do that, your patch has been horribly
> rewrapped by your e-mail client, and it cannot be applied.

I tried to send this patch via git send-email but I have problem with my 
ssl certificate as below;

STARTTLS failed! SSL connect attempt failed with unknown error 
error:14090086:SSL routines:SSL3_GET_SERVER_CERTIFICATE:certificate 
verify failed at /usr/lib/git-core/git-send-email line 1241.

When I solve problem, I will use this tool instead of sending via direct 
e-mail.

>
> The second thing, less important, is that the [BALENA PATCH] subject
> prefix is not necessary, just [PATCH] is sufficient or more precisely
> [PATCHv2] for your next iteration.
>
> The title should be:
>
> 	balena: new package
>
> which is almost the same as what you did, but without the space
> before :, and lower case.
OK
>
> On Mon, 4 Jun 2018 17:22:37 +0300, Refik Tuzakl? wrote:
>>   ?package/Config.in????????? |? 1 +
>>   ?package/balena/Config.in?? | 16 +++++++++++
>>   ?package/balena/balena.hash |? 2 ++
>>   ?package/balena/balena.mk?? | 68
>> ++++++++++++++++++++++++++++++++++++++++++++++
> Please add an entry in the DEVELOPERS file for this package.
OK
>
>> +??? source "package/balena/Config.in"
>>   ???? source "package/bootutils/Config.in"
> Indentation is wrong here, but maybe it's an artefact of not sending
> with git send-email.
At my local patch file, I can not see this typo but I will take care of it.
>
>> diff --git a/package/balena/Config.in b/package/balena/Config.in
>> new file mode 100644
>> index 0000000..2904d2a
>> --- /dev/null
>> +++ b/package/balena/Config.in
>> @@ -0,0 +1,16 @@
>> +config BR2_PACKAGE_BALENA
>> +??? bool "balena"
>> +??? depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
>> +??? depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
>> +??? depends on BR2_TOOLCHAIN_HAS_THREADS
>> +??? depends on BR2_INIT_SYSTEMD
>> +??? select BR2_PACKAGE_LVM2
>> +??? select BR2_PACKAGE_LVM2_STANDARD_INSTALL
> You need to propagate the dependencies of lvm2 here:
>
>          depends on BR2_TOOLCHAIN_HAS_THREADS
>          depends on BR2_USE_MMU # needs fork()
>          depends on !BR2_STATIC_LIBS # It fails to build statically
OK
>
>> +??? help
>> +??? ? Moby-based Container Engine for Embedded, IoT, and Edge uses
>> +
>> +??? ? https://github.com/resin-os/balena
>> +
>> +
> Only one empty line here.
OK
>
>> +comment "balena needs systemd"
>> +??? depends on !BR2_INIT_SYSTEMD
> Also, please run check-package to make sure the indentation is correct.
OK
>
>> +BALENA_LICENSE = Apache-2.0
>> +BALENA_LICENSE_FILES = LICENSE
>> +
>> +BALENA_DEPENDENCIES = host-go host-pkgconf systemd lvm2
> Drop the host-go dependency, it's not needed because you're using the
> golang-package infrastructure.
OK
>
>> +BALENA_GOPATH = "$(@D)/.gopath"
> I believe this is not needed, it's taken care of by the golang-package
> infrastructure.
OK
>
>> +BALENA_VERSION_DIR = 17.06.0-dev
> Ditto, should not be needed.
OK
>
>> +BALENA_BUILD_TARGETS = balena
> This one is OK.
>
>> +BALENA_INSTALL_BINS = $(TARGET_DIR)/usr/bin/$(target)
> This one doesn't make sense because $(target) is empty. Instead list
> the binaries to be installed.
OK
>
>> +BALENA_CONFIGURE_ENV = GOPATH=${BALENA_GOPATH} \
>> +??? $(TARGET_MAKE_ENV) \
>> +??? $(HOST_GO_TARGET_ENV) \
>> +??? DOCKER_GITCOMMIT=${BALENA_COMMIT} \
>> +??? DOCKER_BUILDTAGS='exclude_graphdriver_btrfs exclude_graphdirver_zfs
>> exclude_graphdriver_devicemapper'
> None of that should be needed with the golang-package infrastructure.
> Look at the docker-engine package for an example.
I thought so but when I remove one of them, it crashes while 
configuring. Even it is balena package, it needs some docker parameters.
>
>> +
>> +BALENA_MAKE_ENV = GOPATH=$(BALENA_GOPATH) \
>> +??? $(TARGET_MAKE_ENV) \
>> +??? $(HOST_GO_TARGET_ENV)
> Same.
>
>> +
>> +BALENA_GLDFLAGS += -extldflags '-static'
> Same.
>
>> +
>> +define BALENA_CONFIGURE_CMDS
>> +??? mkdir -p $(BALENA_GOPATH)/src/github.com/docker
>> +??? ln -fs $(@D) $(BALENA_GOPATH)/src/github.com/docker/docker
> Not needed with the golang-package infrastructure.
golang-package does ;

mkdir -p $(@D)/_gopath/src/github.com/resin-os/
ln -sf $(@D) $(@D)/_gopath/src/github.com/resin-os/balena

but balena needs ;
mkdir -p $(@D)/.gopath/src/github.com/docker
ln -fs $(@D) $(@D)/.gopath/src/github.com/docker/docker

I think this caused by package itself. I am not a developer of balena, I 
can ask this issue to balena developers

>
>> +??? cd $(@D) && \
>> +??? ??? $(BALENA_CONFIGURE_ENV) \
>> +??? ??? bash ./hack/make.sh dynbinary-balena
> Do this in a POST_CONFIGURE_HOOKS.
OK
>
>> +define BALENA_BUILD_CMDS
>> +??? $(foreach target,$(BALENA_BUILD_TARGETS), \
>> +??? ??? cd $(BALENA_GOPATH)/src/github.com/docker/docker/cmd/mobynit; \
>> +??? ??? $(BALENA_MAKE_ENV) \
>> +??? ??? $(HOST_DIR)/bin/go build -v\
>> +??? ??? ??? -ldflags "$(BALENA_GLDFLAGS)"
>> +??? )
>> +endef
> Not needed, it should be done by the golang-package infrastructure.
build directory is

$(BALENA_GOPATH)/src/github.com/docker/docker/cmd/mobynit

I guess buildroot looks $(BALENA_GOPATH)/src/github.com/resin-io/balena/cmd/balena
Am I right?

>
>> +
>> +define BALENA_INSTALL_TARGET_CMDS
>> +??? $(foreach target,$(BALENA_BUILD_TARGETS), \
>> +??? ??? $(INSTALL) -D -m 0755
>> $(@D)/bundles/17.06.0-dev/dynbinary-balena/$(target) $(BALENA_INSTALL_BINS)
>> +??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balenad
>> +??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-containerd
>> +??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-containerd-shim
>> +??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-containerd-ctr
>> +??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-runc
>> +??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-proxy
>> +??? )
> Same.
build step creates

$(BALENA_GOPATH)/src/github.com/docker/docker/cmd/mobynit/mobynit

but we need

$(@D)/bundles/17.06.0-dev/dynbinary-balena/balena

>
> Basically, I have the feeling that you created this package as a
> generic-package originally, and then quickly converted it to
> golang-package. But the golang-package infrastructure greatly
> simplifies Go packages, so you should really leverage the features of
> the golang-package infrastructure.
>
> Could you rework this package to use golang-package more effectively ?
>
> Thanks a lot!
>
> Thomas
I check docker-engine before converting to golang package. Also I took 
balena_git.bb file on meta-resin as a reference for cross-compile 
procedure from Yocto Projects. If I can I want to rework on this package 
with your help.

Cheers,

Refik Tuzakl?
Embedded Software Engineer
IT and Simulation Group

Savronik A.?.

Organize Sanayi B?lgesi

20. Cadde No: 19 26110

Eski?ehir Turkey

Tel?? : (+90 222) 236 1590

Faks: (+90 222) 236 1589

www.savronik.com.tr
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180605/f9c9d606/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: refik_tuzakli.vcf
Type: text/x-vcard
Size: 4 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180605/f9c9d606/attachment.vcf>
