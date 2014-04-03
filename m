From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 03 Apr 2014 08:10:44 +0200
Subject: [Buildroot] init script installation policy
In-Reply-To: <CAAXf6LVtLKm17WOAJ2p+9-+R10vgDYXZFVOYuvXzA9LMOkF9Zw@mail.gmail.com>
References: <533C16A1.3080508@westpond.com>
 <CAAXf6LVtLKm17WOAJ2p+9-+R10vgDYXZFVOYuvXzA9LMOkF9Zw@mail.gmail.com>
Message-ID: <533CFB64.6000508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/04/14 17:55, Thomas De Schampheleire wrote:
> Hi Nate,
> 
> On Wed, Apr 2, 2014 at 3:54 PM, Nathan Ford <nford@westpond.com> wrote:
>> What is the policy for installing init scripts when there is already an
>> init script in the target location? Currently there does not seem to be
>> any consistency. I bring this up as I updated a project to a newer
>> buildroot recently and a package I use went from not installing the init
>> script if it was present, to always installing.
>>
>> For my projects I use a custom skeleton fs and like the fact that I can
>> just store my custom init scripts for the packages I use in the skeleton.
>>
> 
> In this case, the recommendation is to use a rootfs overlay rather
> than a custom skeleton. Where the skeleton provides the _initial_
> layout, and packages then add their stuff afterwards, a rootfs overlay
> is copied _after_ all packages have done their job. This means that
> your custom script in the overlay would take precedence over the
> script provided with the package.

 That said, our policy currently in many cases is to keep existing files
in /etc rather than overwriting them. However, I think this is wrong,
really: packages should overwrite existing files and custom modifications
should be done in a rootfs overlay, as you say.

When two packages compete for the same file, this at least allows us to
enforce some policy, by adding a dependency (like e.g. is already done
for busybox conflicts). Also, it makes it possible to do a foo-rebuild
after a version bump and get the updated config files.


 Regards,
 Arnout

> 
> Have a look at http://buildroot.uclibc.org/downloads/manual/manual.html#rootfs-custom
> 
> Best regards,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
