From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Wed, 11 Oct 2017 18:36:14 -0300 (BRT)
Subject: [Buildroot] pre-built binary packages
In-Reply-To: <20171011151137.469e7fd6@windsurf.lan>
References: <8AE4BE7D9622DF41B76E1AD887AA1A477BB220F1@MARCM-SBS2011.marcmltd.local>
 <20171011151137.469e7fd6@windsurf.lan>
Message-ID: <572050367.13476787.1507757774068.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> Hello,
> 
> On Wed, 11 Oct 2017 11:00:11 +0000, Marc Murphy wrote:
> 
>> I am wondering if it is possible to generate binary releases of
>> packages to be included in the build tree.  For example I have a
>> system that is rooted in 2017.02 and still has work done on some
>> packages but when updating releases from other engineers the changes
>> can get conflicted or messed up resulting in a fresh rebuild.  This
>> normally isn't a problem until Qt is in the equation.  For me once Qt
>> is configured built that's it I shouldn't need to build it again.  Is
>> there any way to 1) export or package the binaries and headers for
>> module archiving 2) use the prebuilt binaries and headers in a new
>> build to prevent having to rebuild Qt again
>> 
>> I think it could be a useful feature to create controlled releases or
>> to speed up builds.
> 
> Buildroot does not implement any mechanism to "cache" build results. It
> is quite complicated to do it right, because you have to figure out
> when an existing build result can be re-used from the cache or should
> be rebuilt. Indeed, "building Qt" doesn't mean anything. With which
> configuration was it built? For which host architecture and which
> target architecture? With which target flags and optimization?
> 
> If you want to speed up your build with Buildroot, consider:
> 
> - Using a faster build machine (more SSD, more RAM)
> - Using an external toolchain
> - Using ccache
> 
> If you want a build system that caches existing build artifacts, then
> you should use OpenEmbedded/Yocto.
> 

Here in Datacom we use "binary artifacts": when we build a package, we make a tarball of the artifacts. When we want to build the package, we try to use the tarball first, if the version (in the tarball) matches the package version.

We have not contributed this solution to buildroot because it doesn't seem to be possible to do this in a generic way. We have this binary artifact generation for our internal packages (and all of them use cmake to build). I think it is the only patch to buildroot that we consider to be "eternal".

You can do the same for any package: you can control what's installed in staging and target, and create a tarball containing these folders and the stamp files. Then, use this Binary, instead of the source, when the binary can be used (same source version, for instance).

So, a compilation in our systems always starts with a "build form binaries" and then "rebuild some parts from source". That's way we would like the python script that implements show-<pkg>-rrdepends to be accepted upstream: combined with binary artifacts, it is possible to build fast (from binaries) and rebuild fast (from source).

-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
