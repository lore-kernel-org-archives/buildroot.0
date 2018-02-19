From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 19 Feb 2018 21:02:37 +0100
Subject: [Buildroot] __mcount on ARC
In-Reply-To: <1519030700.14718.9.camel@synopsys.com>
References: <8e90a87a-7e64-6662-3309-ce0325bc686f@gmail.com>
 <20180219090939.1f050545@windsurf.lan>
 <1519030700.14718.9.camel@synopsys.com>
Message-ID: <f0f25d75-38f2-8587-61a8-76bf0259247f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All

On 02/19/2018 09:58 AM, Alexey Brodkin wrote:
> Hi Zoltan,
>
> On Mon, 2018-02-19 at 09:09 +0100, Thomas Petazzoni wrote:
>> Hello,
>>
>> +Alexey in Cc.
>>
>> On Sun, 18 Feb 2018 19:45:08 +0100, Zoltan Gyarmati wrote:
>>
>>> I'm investigating this [1] autobuild error, where the gpsd build fails
>>> while profiling is enabled, due to undefined reference to `__mcount', on
>>> ARC arch.
> Thanks for doing this!
>
>>> Ironically enough due to a bug in the gpsd build config the -pg flag is
>>> not passed to the linker only to the compiler, but after patching that
>>> one, the build issue remains.
>>> According to this thread [2] this happened earlier with ARC but other
>>> package, so is there anything particular about ARC regarding to
>>> profiling? Should we just disable the gpsd profiling option on ARC?
>>>
>>> [1]
>>> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_88870f5bf4aff557d8eac4e1cc5d3e397e607af0_&d=DwICAg&c=DPL6_X_6J
>>> kXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=qUcbt2aQC5rv6A60vraf7le_bHJUKsNqmF82o_vwG88&s=Ex2r0cYgj4xqNS_I3TFKJaGy4ZSEyhGl1WyyW1
>>> 880sY&e=
>>>
>>> [2]
>>> https://urldefense.proofpoint.com/v2/url?u=http-3A__buildroot-2Dbusybox.2317881.n4.nabble.com_autobuild-2Dbuildroot-2Dnet-2DBuild-2Dresults-2Dfor-
>>> 2D2017-2D11-2D19-
>>> 2Dtd180416.html&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=qUcbt2aQC5rv6A60vraf7le_bHJUKsNqmF82o_vwG88&s=Ig
>>> Fx-7wIxdakr0F3vfv1Nlf6kH6Z62gCs0QqtOh0TGI&e=
> If you're talking about
> http://autobuild.buildroot.net/results/69032f10edcfd65fd81d62a6854a4c06fa204d76/
> then it's not the same, there uClibc was used which is known to be lacking
> gprof support but in case of gpsd we deal with glibc so read-on...
>
>> Alexey, could you comment on this ? I vaguely remember that profiling
>> was not supported on ARC at some point, but I have no idea if this is
>> still the case or not.
> Looks like ARC port of glibc only defines "_mcount" but not "__mcount", see
> ------------------------------------->8---------------------------------
> arc-linux-readelf -s libc.so.6 | grep mcount
>    124: 000b397c     4 FUNC    GLOBAL DEFAULT   11 _mcount@@GLIBC_2.26
>    423: 000df95c    44 FUNC    GLOBAL DEFAULT   11 _dl_mcount_wrapper_check@@GLIBC_2.26
>   1584: 000df944    22 FUNC    GLOBAL DEFAULT   11 _dl_mcount_wrapper@@GLIBC_2.26
> ------------------------------------->8---------------------------------
>
> and https://github.com/foss-for-synopsys-dwc-arc-processors/glibc/blob/vineet-glibc-master/sysdeps/arc/machine-gmon.h#L26
>
> I'm an expert in neither glibc nor gprof so not sure what is a difference between
> _mcount vs __mcount but for AArch64 thay set "strong_alias (__mcount, _mcount)" here:
> https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/aarch64/mcount.c#l32
>
> So maybe we need to do the same for ARC.
>
> Adding Vineet's who's doing ARC port of glibc to maybe add this missing bit :)
>
> -Alexey

Thanks for the background info!
According to the gprof documentation [1]:

"which causes every function to call |mcount| (or |_mcount|, or
|__mcount|, depending on the OS and compiler) as one of its first
operations."

?And a couldn't find any note about difference between the 3 so it seems
we are safe to assume that these are the same.
Is there any intention to patch the ARC glibc in Buildroot with the
mentioned strong_alias (or at later point even the upstream source tree?)
Any opinions?


[1] https://sourceware.org/binutils/docs/gprof/Implementation.html


Zoltan Gyarmati
https://zgyarmati.de

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180219/b4a958ab/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180219/b4a958ab/attachment.asc>
