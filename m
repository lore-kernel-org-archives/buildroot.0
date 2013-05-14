From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 14 May 2013 11:02:32 +0200
Subject: [Buildroot] [PATCH] linux: CONFIG_KERNEL_LZO option requires
	host-lzop
In-Reply-To: <20130513100421.4a84d09f@skate>
References: <1368431920-22020-1-git-send-email-fabio.porcedda@gmail.com>
 <20130513100421.4a84d09f@skate>
Message-ID: <CAHkwnC_KQ30thPqy3WA3wGpOipMfmf6rk-HY78sf=Dus8F9ExQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 13, 2013 at 10:04 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Mon, 13 May 2013 09:58:40 +0200, Fabio Porcedda wrote:
>> When the LZO compression mode is chosen the linux kernel requires
>> lzop host utility at build time.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
>>  linux/linux.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index d375cf0..3877c35 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -34,7 +34,7 @@ endif
>>  LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
>>
>>  LINUX_INSTALL_IMAGES = YES
>> -LINUX_DEPENDENCIES  += host-module-init-tools
>> +LINUX_DEPENDENCIES  += host-module-init-tools host-lzop
>
> Yeah, I know about this problem, but I'm not entirely happy with this
> solution. Since we can't have dependencies that depend on the kernel
> configuration (because at the time make parses linux.mk, the kernel
> configuration hasn't been created yet), we have to make host-lzop a
> mandatory dependency. Then, later on, someone will came up with the
> same problem for the LZMA compression. And then the kernel, in some
> special case will need yet another tool installed on the host machine.
>
> I agree that host-lzop is not huge, but it's a pain to have things
> being built that will not be used.
>
> The only alternative that I see is that the kernel compression should
> be selected in Buildroot, which will then enforce this selection into
> the kernel configuration. Therefore, Buildroot will have the knowledge
> of which compression tools will be needed.
>
> Now, whether this alternative really scales if the kernel starts to
> have more and more host dependencies, I don't know.
>
> Thoughts? Ideas? Maybe I'm just nitpicking here?

Hi Thomas,
thanks for reviewing.

I know that the best solution is to depend on the linux kernel
configuration, but I don't know a way to do that cleanly.
Maybe some clever idea?

Adding mandatory dependency is the simplest and always works but as
you pointed it always builds host-lzop even when is not used.

Choosing the compression within buildroot doesn't wok when using a
defconfig or linux-xconfig target but at least does build host-lzop
only when is used.

Nevertheless I'm fine with both solutions, i just want to fix this problem.

Best regards
--
Fabio Porcedda
