From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2020 21:26:07 +0200
Subject: [Buildroot] [PATCH v3 09/10] package/ripgrep: add legal-info
 for dependencies
In-Reply-To: <20200220160119.3407-9-patrick.havelange@essensium.com>
References: <20200220160119.3407-1-patrick.havelange@essensium.com>
 <20200220160119.3407-9-patrick.havelange@essensium.com>
Message-ID: <20200826212607.7a336dad@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Thu, 20 Feb 2020 17:01:18 +0100
Patrick Havelange <patrick.havelange@essensium.com> wrote:

> As the dependencies are now vendored in the tarball, we can
> extract them easily. Added a helper script to list them.
> Updated the .hash & .mk files with those new licenses.
> 
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> ---
>  package/ripgrep/find_vendor_licenses.sh |   6 +
>  package/ripgrep/ripgrep.hash            | 167 +++++++++++++++++++++++
>  package/ripgrep/ripgrep.mk              |   4 +-
>  package/ripgrep/vendor.inc              | 169 ++++++++++++++++++++++++
>  4 files changed, 345 insertions(+), 1 deletion(-)

At the latest virtual Buildroot Developers Meeting, Yann and I talked
about this. I'll paste the complete IRC conversation below. In short,
Yann wanted some way of dynamically grabbing the legal information at
runtime, but our discussion made it clear (I believe) that this was not
possible. Yann agreed that a static description of the licenses and
licenses files (like you did) was the only option. However, Yann didn't
like that the vendor licenses are described in a separate vendor.inc
file. I personally don't mind too much, as we already do that for the
qt5webengine package. Overall, I believe this aspect is fairly minor
compared to the concerns about the download backend.

Here is the unedited IRC conversation:

[15:32:56] <y_morin> kos_tom: For cargo: I do not like the vendor.inc stuff at all...
[15:33:05] <kos_tom> y_morin: do we have a better proposal ?
[15:33:33] <y_morin> kos_tom: Yes: handle it in the cargo infra
[15:33:46] <y_morin> I.e.: do not let the packages do the inclusion by themselves.
[15:33:53] <kos_tom> how would you do that? we don't support "dynamic legal-info" currently
[15:35:29] <y_morin> And in the infra:  include $(pkgdir)/vendor.inc     $(1)_LICENSE += , $($(1)_VENDOR_LICENSE)   $(1)_LICENSE_FILES += $($(1)_VENDOR_LICENSE_FILES)
[15:36:05] <y_morin> kos_tom: The trick with the license list, is that the 'space-comma' is properly replaced by a comma in the legal-infra already
[15:36:25] <kos_tom> mooh, https://github.com/facebook/rocksdb/commit/085e4dcf8173e91311fbf9037d8bc9393f254c6f exists, but "git show 085e4dcf8173e91311fbf9037d8bc9393f254c6f" in this repo says "no such commit"
[15:36:54] <kos_tom> y_morin: but the value of this VENDOR_LICENSE variable would only be known after the package has been downloaded
[15:36:56] <y_morin> (*if* we can get the license list of the vensored stuff; having the license fiels would already be nice enough)
[15:37:04] <kos_tom> y_morin: how does the infra fills it in ?
[15:37:07] <y_morin> Ah, right/
[15:37:24] <kos_tom> that's what I called "support for dynamic legal-info"
[15:37:39] <y_morin> No, no, the infra does not fill in the variables, they are prepared as is.
[15:37:45] <y_morin> ... as is in the series.
[15:37:52] <kos_tom> aah, github says "This commit does not belong to any branch on this repository."
[15:38:04] <y_morin> Except it is not the package ./mk that does the include and aggregartion, but the cvargo infra
[15:38:09] <kos_tom> y_morin: ah, so it doesn't change much compared to the series
[15:38:20] <y_morin> No, not much.
[15:38:37] <y_morin> kos_tom: Except the series as is does not even catter for the list of licenses either.
[15:39:21] <y_morin> kos_tom: But:
[15:39:42] <y_morin> 1) I am not too fond of the vendor.inc to begin with; the info should be in the .mk
[15:40:00] <y_morin> 2) *if* we want to go with the vendor.inc, then let's handle it in the cargo-infra
[15:40:17] <y_morin> But TBH, I would really prefer option 1.
[15:40:40] <y_morin> There is no reason to single out cargo from other infras.
[15:41:36] <kos_tom> y_morin: we do have something similar as the vendor.inc already today
[15:41:56] <y_morin> Where?
[15:42:02] <kos_tom> enjoy package/qt5/qt5webengine/chromium-latest.inc
[15:42:23] <y_morin> Oh noes... :-(
[15:43:18] <y_morin> kos_tom: OK, so *if* we want to go that route, let's not let packages handle it, but let's handle it in the infra, and in pkg-generic at that.
[15:44:05] <kos_tom> hm, maybe this is something we should do long-term, but I'm not sure it's really something we should promote at the pkg-generic level today
[15:44:18] <kos_tom> we're only talking about a few cargo-related packages for now
[15:46:05] <y_morin> kos_tom: https://pastebin.com/AQfyKaSL
[15:46:18] <y_morin> I think it would not be much more complex that that.
[15:46:46] <kos_tom> doesn't account for per-version subdirectories
[15:47:04] <kos_tom> for qt5webengine, we use two have .inc files :-)
[15:47:09] <y_morin> Yes, yes... You are nit-picking. ;-)
[15:47:26] <kos_tom> to me, that is a minor detail in the whole story
[15:47:37] <kos_tom> the question is: do we accept to handle legal-info for cargo packages this way ?
[15:48:05] <y_morin> To me: no.
[15:48:21] <y_morin> I'd like chromuium stays the esception.
[15:49:19] <y_morin> I don;t think this is a problem that the .mk of cargo packages is just 99% legal-stuff. That's just the sad story there is to it.
[15:49:42] <y_morin> Also, I don't like that parts of the legal-info is in the .mk, and part in the vendor.inc.
[15:50:25] <y_morin> Unless we decide that we want to move the legal-info to is own file, like foo.mk foo.hash and now foo.legal
[15:50:45] <y_morin> But meh, I would keep everything in a single file, please.
[15:50:47] <kos_tom> the idea for qt5webengine is also that the .inc file is kind of auto-generated
[15:51:07] <y_morin> Havinf the legal-info in a side file means it fille bit-rot there ebecause no one will look/update it.
[15:51:37] <y_morin> kos_tom: So what? The legalinfo in scan-pypi or scan-cpan is also autogenerated the first time. Tyhen it is manually updated..
[15:51:58] <kos_tom> y_morin: no, it is again updated with scanpypi or scancpan
[15:52:05] <kos_tom> scanpypi and scancpan are not one-time scripts
[15:52:18] <Jacmet> kos_tom: yeah, I couldn't backport the gnutls security bump before we had a fix for uclibc
[15:53:34] <Kubu> kos_tom: ok, I'm able to build bat
[15:53:40] <kos_tom> Kubu: ah :)
[15:53:43] <Kubu> even with ARM toolchain
[15:58:44] <y_morin> kos_tom: So, even the generated packages are properly updated, so even that is not an excuse ti have the licensing info outside the .mk
[15:58:58] <y_morin> (sorry, I had a sigfood from the nano-tigers...)
[16:00:33] <y_morin> Kubu: When you're done with cargo/rust, mind diving back into elf2flt:  https://patchwork.ozlabs.org/project/buildroot/patch/20200726094338.1276868-1-fontaine.fabrice at gmail.com/  ? ;-)
[16:01:27] <Kubu> y_morin: well, there is no much change in this version compared to what we have currently
[16:02:00] <kos_tom> y_morin: again, to me inside/outside the .mk is a small detail
[16:02:21] <kos_tom> Lightsword: have you looked at the Lua 5.4 series from Fran?ois Perrad ?
[16:02:22] <y_morin> kos_tom: So I am not sure I understood your question...
[16:02:23] <Kubu> it's just about sync with with the tag added recently
[16:02:52] <kos_tom> y_morin: are we OK with handling legal-info like this, i.e it's quite manual. I anyway don't really see any other option.
[16:03:36] <y_morin> kos_tom: Still, not sure to understand... :-/
[16:04:30] <y_morin> kos_tom: In fact, we *could* very well have the list established at runtime.
[16:04:31] <kos_tom> y_morin: well, aside the location of the legal details, are we OK with the way it's done ?
[16:04:59] <y_morin> Since the lists are not used to generate Makefile code, they are only evaluated in shell context
[16:05:20] <kos_tom> ooh, but
[16:05:22] <y_morin> so we could do:  FOO_LICENSE = `some script to extract the list`
[16:05:23] <kos_tom> we already have BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
[16:05:33] <kos_tom> which contains 5.1 for LuaJIT/Lua5.1 and 5.3 for Lua 5.3
[16:06:03] <y_morin> and FOO_LICENSE_FILES = `some script to extract the list of files`
[16:06:04] <kos_tom> y_morin: but then we could only evaluate the FOO_LICENSE variable after the download has taken place
[16:06:32] <y_morin> kos_tom: No, because the variable are evaluated when the corresponding make rule is generated.
[16:07:02] <y_morin> which is another rule than foo-legal-info
[16:07:32] <y_morin> So, at the time foo-lkegal-info is "started/run", the foo-extract and foo-patch are finished
[16:08:07] <y_morin> .. it should work (famous last words)
[16:08:23] <kos_tom> y_morin: well, if I do "make FOO_LICENSE printvars"
[16:08:47] <y_morin> That won;t work if the patckage is not extractd/patched, no. indeed.
[16:09:09] <y_morin> So that wouild bust show-info too
[16:09:12] <y_morin> So not good.
[16:10:01] <y_morin> We indeed do need a static list of licenses and files

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
