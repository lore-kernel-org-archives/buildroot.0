From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 07 Feb 2014 10:25:10 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140207135324.4c7cbe3f@skate>
References: <20140207073009.C5A85100E3A@stock.ovh.net>
 <20140207135324.4c7cbe3f@skate>
Message-ID: <52F4DEB6.3040703@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/07/2014 09:53 AM, Thomas Petazzoni wrote:

> Hello all,
> 
> You'll find below a quick analysis of the build failures. If you are in
> Cc, it means that there is a question for you below, or a request to
> help debugging a specific problem. Thanks!
> 
> On Fri,  7 Feb 2014 08:30:09 +0100 (CET), Thomas Petazzoni wrote:
> 
>> Detail of failures
>> ===================
>>
>>       bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/b25590e19d0e638dcbb2855a84e82ea7b2703460/
> 
> There is a patch pending that fixes this issue:
> http://patchwork.ozlabs.org/patch/293833/. Maybe we should merge it?

Alsa upstream didn't respond to Sonic's patch.
At the time i thought it could be made somewhat nicer without the dl
dummy defines by #ifdef'ing out the RTLD usage, but waited on upstream
to chime in and well... nothing happened :)

>>        arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/a46b4c97fe126b23a96051a8bf1243a7f4935434/
>>        arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/ac2d0808752ef5e31dc7121b9f00e1968e8a3621/
>>        arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/232dfa5c786b0423dde4fdb3166fdd8e746bb34b/
>>       i686 |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/799f24846ba800500243bb69e85a1d6b10960ef3/
>>        arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/77f1b0d537d6d2aa1eea066d15f46fc492ff160d/
> 
> Linking problem against libvorbis. To be investigated. Gustavo ?

mpd 0.18 introduced the vorbis encoder option, which is an automatic
option as most. If vorbis (decoder) is not enabled and the library is
present vorbis encoder is automatically enabled, but mpd doesn't do the
libvorbis magic as it should thus failing.
Easy fix forcibly disabling all of the vorbis bits in the package, patch
sent.

>>    powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/399e62acf2c452653cb2ee9ca150a0cfe7e33326/
> 
> Missing setns() on CodeSourcery toolchain. Since util-linux is really
> needed for many packages, it would be good to find a fix that doesn't
> involve disabling util-linux completely.
> 
> checking for syscall setns... no
> configure: WARNING: Unable to detect syscall setns.
> configure: error: nsenter selected but setns syscall not found
> make: *** [/home/test/test/3/output/build/util-linux-2.23.2/.stamp_configured] Error 1
> 
> Gustavo, an idea?

Yes, blame commit 9f91d79601da42516752318beecfd080dc05aac9
Before it was an option util-linux decided if it was appropiate to build
it according to setns() being available, now we may be forcing it when
the syscall may simply be unavailable (like this toolchain).
We can do a ton of toolchain kludges or just revert, i'd prefer the
second option since it's not like a super-common command (actually most
distros don't have it yet because it's pretty new for util-linux).
Regards.
