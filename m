From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Nov 2015 00:34:00 +0100
Subject: [Buildroot] [PATCH] support/dependencies: ensure we have 'file'
 on the host
In-Reply-To: <20151127230443.GD4144@free.fr>
References: <1448654529-27021-1-git-send-email-yann.morin.1998@free.fr>
 <5658C8C7.4080104@mind.be> <20151127230443.GD4144@free.fr>
Message-ID: <5658E868.5090006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-11-15 00:04, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-11-27 22:19 +0100, Arnout Vandecappelle spake thusly:
>> On 27-11-15 21:02, Yann E. MORIN wrote:
>>> When 'file' is missing on the host, libtool fails miserably. Packages
>>> that use libtool will suddenly FTBFS, with cryptic error messages, like
>>> missing libraries on the linker invocation.
>>
>>  I've taken a look at an ltmain.sh and a libtool, but the only two calls to
>> 'file' I could find were for darwin and for win32.
>>
>>>
>>> We could ensure that autotools based packages now all depend on
>>> host-file. But It itself is an autotools package, so it's again a
>>> chicken-n-egg issue. And even non-autotools package may use libtool.
>>>
>>> So, just require that 'file' is present on the host.
>>>
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> ---
>>>  support/dependencies/dependencies.sh | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
>>> index 3146401..f14fb79 100755
>>> --- a/support/dependencies/dependencies.sh
>>> +++ b/support/dependencies/dependencies.sh
>>> @@ -69,6 +69,12 @@ check_prog_host "which"
>>>  # Verify that sed is installed
>>>  check_prog_host "sed"
>>>  
>>> +# 'file' must be present, otherwise libtool fails in incomprehensible
>>> +# ways. For example, bandwidthd would fail to link with -lz, even
>>
>>  bandwidthd doesn't even have a libtool...
>>
>>  Could you give a concrete example of where libtool uses file?
> 
> Damn... It seems I confused the netsnmp and the bandwidthd cases.
> 
> If you look at netsnmp, they have all this blurb about file being
> required for libtool otherwise it breaks, in configure.d/config_os_progs
> And indeed, my minimalistic chroot does not have file installed.

 Well, I ran

strace -f -e trace=execve make netsnmp

and the only call to file was in the configure script...

 That said, adding file as a global dependency is probably the easiest way of
dealing with it. In practice, file is anyway installed in default distro.


 Regards,
 Arnout

> 
> And then you have bandwidthd that also fails miserably in that chroot,
> even though the same configuration works on my machine.
> 
> So I installed 'file' and then both now compile without any issue in
> that minimalistic chroot.
> 
> And then I did the commit log for this patch, and only accounted for the
> reasons explained in netsnmp (without trying to validat etheir point, I
> admit), but referenced bandwidthd.
> 
> Sigh.
> 
> Anyway, here's my minimalistic chroot:
>     debootstrap --arch=amd64 --variant buildd trusty $(pwd)/chroot
> 
> and the list of installed packages is in attachment.
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
