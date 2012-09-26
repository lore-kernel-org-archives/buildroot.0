From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Sep 2012 10:19:20 +0200
Subject: [Buildroot] Host xmllint dynamic link failure
In-Reply-To: <20120926093025.0ba0c3d0@skate>
References: <50624463.1000200@mind.be> <20120926093025.0ba0c3d0@skate>
Message-ID: <5062BA88.3000906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/26/12 09:30, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Wed, 26 Sep 2012 01:55:15 +0200, Arnout Vandecappelle wrote:
>>    During one of my test builds, I ran into a dynamic linker failure
>> when running xmllint:
>>
>> /usr/bin/xmllint: relocation error: /usr/bin/xmllint: symbol
>> xmlShell, version LIBXML2_2.4.30 not defined in file libxml2.so.2
>> with link time reference
>>
>>    The problem is that we compile with
>> LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:", so that our host-libxml2 is
>> used instead of the one in /usr/lib.  Or, the problem is
>> that /usr/bin/xmllint is used instead of
>> $(HOST_DIR)/usr/bin/xmllint.  The path is hardcoded in xmlto...
>>
>>    Possible solutions:
>>
>> - Build host-xmlto.  This will require updating all packages using
>> xmlto to add host-xmlto to the dependencies.
>
> I am not sure to understand. Aren't we already building xmllint for the
> host? I don't follow your explanation entirely here. Anyway, if there
> is something from the host that we're using and that isn't part of the
> mandatory Buildroot dependencies, then it should definitely be built as
> a dependency, yes.

  xmllint yes, but not xmlto.  And xmlto hard-codes the path to xmllint
(and to /usr/bin/locale and /usr/bin/xsltproc as well...).

  xmlto is used to generate the documentation in the new X11 packages
(not sure if it was the case before already).  Disabling documentation
also works :-).  If xmlto can't be found, the documentation won't be
built.  That's why you don't see a problem in the autobuilders.


>> - Remove LD_LIBRARY_PATH and rely on rpath to find the libraries.
>> This may require patching some of the host packages.  At first sight,
>> it doesn't look too bad, however.
>
> Normally yes, I think we should remove LD_LIBRARY_PATH. The idea is to
> build all binaries installed in $(HOST_DIR)/usr/bin with a rpath, and
> that is normally sufficient to let them find the libraries.

  OK.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
