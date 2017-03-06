From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Mar 2017 13:40:06 +0100
Subject: [Buildroot] [RFC PATCH 1/9] package/patchelf: use a recent
 version and add "--make-rpath-relative" patch
In-Reply-To: <8de5b9aa-984e-d35b-8900-88cd756d46cd@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-2-git-send-email-wg@grandegger.com>
 <6f9b5eb0-34dc-498c-b23e-cb6449071210@mind.be>
 <edacb9c4-60c3-5dad-c4a3-863af839f66b@grandegger.com>
 <ac285508-f2d1-d98a-4a78-af72b693bb51@mind.be>
 <8de5b9aa-984e-d35b-8900-88cd756d46cd@grandegger.com>
Message-ID: <3362483d-bf2a-931a-594b-4450542957af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-03-17 09:42, Wolfgang Grandegger wrote:
> Am 06.03.2017 um 00:13 schrieb Arnout Vandecappelle:

[snip]
>>  For us, the forbiddenRpathPrefixes will always be /lib:/usr/lib. But for
>> upstream, it is more useful to have a general solution that can also be applied
>> in other situations. Concretely, I'm thinkinf of /lib64 and
>> /lib/x86_64-linux-gnu - in Buildroot they are symlinks to /lib so will already
>> be caught by the path canonification, but in other distros they may be distinct
>> directories that are still in the default search path.
> 
> I just see... we have a problem here. There are no symlinks:
> 
>   patching ELF file '/opt/bdo/dcu_host/host/usr/x86_64-pc-linux-gnu/x86_64-buildroot-linux-gnu/lib/libopcodes-2.25.51.so'
>   removing directory '/opt/bdo/dcu_host/host/usr/lib' from RPATH
>   new rpath is ''
> 
> The rpath is removed because it did not find the needed library in
> "HOST_DIR/usr/lib/". Actually it's in
> "HOST_DIR/usr/x86_64-pc-linux-gnu/x86_64-buildroot-linux-gnu/lib.

 I don't know what you're trying to say here... We were talking about the
--no-standard-libs (which is used for target packages) while here you give an
example of a host package. Also, the path you mention *can* be removed because
it is not helpful, the library you need is in a subdirectory of that directory.

[snip]

> I think I now understand your proposal... Here are the steps assuming that we
> extend --shrink-rpath. We also need --make-rpath-relative and --remove-rpaths.
> The patchelf command than would be:
> 
> $ patchelf --shrink-rpath --remove-rpaths $ROOTDIR/lib:$ROOTDIR/usr/lib
> 	   --make-rpath-relative $ROOTDIR

 Exactly, and for the host packages it would just be --shrink-rpath
--make-rpath-relative.

> 
> Actions before --shrink-rpath to deal with relative paths:
> - resolve $ORIGIN
> - resolve $ROOTDIR/path-within-rootdir if it exists

 Yes, so these are only executed when --make-rpath-relative is specified
(otherwise there is no $ROOTDIR, and otherwise you loose the $ORIGIN).


> Actions in --shrink-rpath:
> - remove rpath dir if not within $ROOTDIR (we cannot use allowed-rpath-prefixes)

 Hm, I didn't think of that before - why can't we use allowed-rpath-prefixes?

> - remove rpath dirs specified by "--remove-rpaths"
> - remove rpath dirs if they do not contain any needed library
> 
> Actions in --make-rpath-relative:
> - Replace the valid absolute path with a relative one using $ORIGIN
>  
> I'm going to check if I can integrate it nicely into the existing code. 
> I think it will be more intrusive than my first proposal. More soon...

 Maybe it's best to already post your current patches (split into two patches
and maybe with some minor cleanups that we agreed on) to upstream, and add in
the cover letter the idea that it could be done in a different way. If what you
have now is good enough for upstream, there is no need to change it.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
