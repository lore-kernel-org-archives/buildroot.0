From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 1 Feb 2016 11:13:58 +0100
Subject: [Buildroot] [PATCH 03/16 v3] core/pkg-utils: add macro to
 hardlink-or-copy
In-Reply-To: <56AE8E21.4020904@mind.be>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
 <496a4dbb0c7e2bfd0be8726e3d8a2aab4f1d830d.1454004518.git.yann.morin.1998@free.fr>
 <56AE8E21.4020904@mind.be>
Message-ID: <56AF2FE6.1060206@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Arnout Vandecappelle wrote:
> On 28-01-16 19:15, Yann E. MORIN wrote:
>> This macro will try to copy a source file into a destination fdirectory,
>> by first atempting a hard-link, and falling back to a plain copy.
>>
>> In some situations, it will be necessary that the destination file is
>> named differently than the source (e.g. due to a re-numbering), so if a
>> third argument is specified, it is treated as the basename of the
>> destination file.
>>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> ---
>> Changes v2 -> v3;
>>    - use "ln" instead of "cp -l"
>>    - accept third argument, as the basename of the destination file
>>    - drop reviewed-by and tested-by tags given in v2, due to the above
>>      two changes
>>
>> Changes RFC -> v1:
>>    - move to pkg-utils  (Luca)
>> ---
>>   package/pkg-utils.mk | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> index 44bd2c9..6479cd8 100644
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -113,6 +113,31 @@ $$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
>>   endif
>>   endef
>>
>> +################################################################################
>> +# hardlink-copy -- hardlink source and destination if possible, otherwise
>> +# do a simple copy
>> +#
>> +# argument 1 is the source *file*
>> +# argument 2 is the destination *directory*
>> +# argument 3 is the basename of the destination file (optional, defaults to
>> +#            the basename of the source file.
>> +#
>> +# examples:
>> +#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir/)
>> +#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir/,new-name)
>> +#
>> +# Note: we make that a single command, so se can:
>> +#  - use '$(Q)' in front of it and properly silence the whole macro,
>> +#  - use '|| exit 1' after it, so we can exit on error in compound commands.
>> +################################################################################
>> +define hardlink-copy
>> +	{ mkdir -p $(2) && \
>> +		{ ln $(1) $(2)$(if $(3),/$(strip $(3))) 2>/dev/null || \
>
>   Shouldn't this be ln -f (and maybe cp -f) to make sure it behaves the same when
> you run it a second time?

Indeed it's true. Not an issue for 'make legal-info' since it wipes the
output dir before copying file in it, but the macro is generic so it
has to handle this case.

This definitely applies to ln. cp normally doesn't need it, but it does
not hurt.

-- 
Luca
