From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Wed, 14 Mar 2018 11:11:59 +0100
Subject: [Buildroot] Start denying fuzz in patches?
In-Reply-To: <CAFSsvmo-Esz6zXC-qpMJ9Uww=sEbV75Uw7kNNLumWxk83A1kKA@mail.gmail.com>
References: <CAFSsvmo-Esz6zXC-qpMJ9Uww=sEbV75Uw7kNNLumWxk83A1kKA@mail.gmail.com>
Message-ID: <ca8bdf6b-fb45-f0c8-9f00-9f2790046af1@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/03/2018 11:06, Adam Duskett wrote:
> The patch tool will apply patches by default with "fuzz," which is where if the
> hunk context isn't present but what is there is close enough, it will force the
> patch to be applied anyways.
> 
> While this is useful when there are just whitespace changes, when applied to
> actual source code, it is possible for a patch applied with fuzz to produce
> broken code which still compiles.
> 
> I propose that Buildroot take the initiative to start cleaning up the current
> patches, and in the future start denying updates/new packages with patches that
> apply with fuzz.
> 
> Comments would be much appreciated!

This may complicate bumping packages with patches (python comes to mind,
and it has in fact the largest number of patches[1]).

However, for patches coming from the user (e.g. br2_external tree,
global patch dirs, kernel patches), this can greatly complicate things
that worked before, so it should be maybe optional.

for example, we have a single buildroot tree for multiple targets with a
a generic global patch dir that includes patches for the linux kernel.
The kernel version may be different for each target, even when we try to
avoid it...

It could be as simple as a Apply-With-Fuzz header in the patch description:

fuzz_factor="$($uncomp "$path/$patch" | sed -nre '1,/^--- /
s/^Apply-With-Fuzz: (.*)/\1/p')"
fuzz_factor="${fuzz_factor:-0}"

[1]: cd package; for a in *; do printf "%d: %s\n" "$(ls $a/*.patch
2>/dev/null | wc -l)" "$a"; done | sort -n
