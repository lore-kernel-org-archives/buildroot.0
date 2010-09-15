From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 15 Sep 2010 23:39:40 +0200
Subject: [Buildroot] Integration of crosstool-NG as backend - Status report.
	And patch! :-)
Message-ID: <201009152339.40967.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here is a quick summary on the integration of crosstool-NG as a backend
to generate toolchains in lieu of the internal mechanism.

After the code-shifting and generalisations pushed in the latest stable of
buildroot, I continued working on the backend stuff. It has been delayed a
little bit while I was on holidays, but I resumed early last week. So...

Building crosstool-NG itself: 75%
- using crosstool-NG 1.8.0
  -> will update to 1.8.1 before pushing  [A]
- using "./configure --local" for now, as it is easy to use
- using hand-crafted get, unpack, patch, build, and install rules
  -> need to switch to the generic infrastructure later, if possible  [B]

Configuring the toolchain: ~50%
- has a default crosstool-ng.config file
- uses existing, and adds new high-level options in buildroot's menuconfig
  - arch selection
  - C library selection and some options
- uses those options to munge the crosstool-NG's .config
  - only basic stuff is in: arch, endianness, bitness...
  -> will need quite a lot of work to push all options:  [C]
     - arch options: soft-float, ABI, CPU, tune...
     - uClibc/eglibc config files...
     - others...
  -> no sanity check is done for those options for now  [D]
  -> maybe they shall disapear from buildroot's menuconfig
     when crosstool-NG is used as a backend ?
- offers a ctng-menuconfig rule to tweak the configuration
  - after save, overide with options from buildroot again
  -> will need a warning that the user's choice were overiden  [E]
- whenever options in buildroot's .config change, toolchain is rebuilt
  - needed because some of those options are needed for crosstool-NG
  -> inconvenient in case a package is added/removed, or other
     non-toolchain option is changed
  -> will need a two-step check of crosstool-NG's .config to see if
     it did change indeed  [F]

Building the toolchain: 100%
- toolchain installed properly in $(O)/toolchain
- libs properly copied to $(O)/target
- sysroot properly copied to $(O)/staging

Using the toolchain: 75%
- properly _built_ trivial busybox-based image
-> needs more thorough testing with bigger set of packages  [G]
-> needs run-time testing                                   [H]

Misc:
- requires the previously-posted sed patch to move the host-sed.
  -> included in the attached patch

Planning:
- 20100919: push stable patch to list with current feature list:
  [E], [F], and parts of [C]; maybe [D]
- 20100930: push stable patch to list with sanity checks and cleanups:
  [A], [B], [D], and parts of [C], [G] and [H]
- 20101015: fixes
- aiming for inclusion for 2010.11

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br.ct-ng.patch
Type: text/x-diff
Size: 31080 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100915/4b853c4a/attachment-0001.bin>
