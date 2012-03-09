From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 09 Mar 2012 10:12:35 +0100
Subject: [Buildroot] [RFC v2 00/31] Automatically produce legal
 compliance info
In-Reply-To: <CAAXf6LVYnD1OnwCExsE26e2jcY=TE-=BOUB-v5-g-4=+6_0tRA@mail.gmail.com>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
 <CAAXf6LVYnD1OnwCExsE26e2jcY=TE-=BOUB-v5-g-4=+6_0tRA@mail.gmail.com>
Message-ID: <4F59C983.8050605@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire wrote:
[...]
>> However I hit a few issues that still need to be sorted out, see the "ISSUE"
>> sections below.
>>
>> My approach is based on two per-package constants in eack .mk file, such as:
>>   FOOBAR_LICENSE = GPLv3 + LGPLv2.1
>>   FOOBAR_LICENSE_FILES = COPYING.LGPL demo-app/COPYING.GPL3
>> or:
>>   MYAPP_LICENSE = PROPRIETARY
>>   # MYAPP_LICENSE_FILES not relevant in this case
>> This is the only effort required to the package creator. If<PKG>_LICENSE is
>> not specified it defaults to "unknown".
>>
>> After running 'make legal-info', the following things will be produced in
>> $(O)/legal-info/:
>>   $ find legal-info/ -type f
>>   legal-info/README            # Lists saved stuff, warns about unsaved stuff
>>   legal-info/licenses.txt      # Text of all licenses
>>   legal-info/buildroot.config  # The buildroot config
>>   legal-info/licenses/buildroot/COPYING       # License files, one dir per pkg
>>   legal-info/licenses/busybox/LICENSE         # ...
>>   legal-info/licenses/...other packages...    # ...
>>   legal-info/manifest.csv                     # CSV table summarizing all info
>>   legal-info/sources/busybox-1.19.4.tar.bz2   # tarballs
>>   legal-info/sources/kmod-5.tar.xz            # ...
>>   legal-info/sources/libtool-2.2.10.tar.gz    # ...
>>   legal-info/sources/...other packages...     # ...
> I'm a bit confused by licenses.txt: if we already have each individual
> license file in the licenses/<package>  directory, why do we need an
> aggregated set in licenses.txt ?

Producing many output formats makes it more likely that one finds his preferred
one...
Consider a product that's shipped without any CD-ROM, and no screen, no GUI, so
no capability  to show licenses on-screen. The only way to comply to the GPL
would be to print licenses in the paper documentation. In such a case the
documentation writers would probably prefer to receive a single file they just
need to copy-paste in their typesetting software, fix fonts and title
formatting and they're done. If they were fed 30~40 files to copy-paste from,
add titles or at least separators between each other etc, they would have more
boring work to do, and also error-prone.


>> Given the technical difficulties, the toolchain and the BR sources are not
>> saved. Warnings are generated to make sure the user is aware of this.
>>
>> Following is an explanation of the open issues and future development
>> directions. Actually issue 3 is the one where I mostly would like to have
>> comments, so you may skip to it if your time is limited. Otherwise seat down
>> comfortably and read on.
>>
>>
>> ISSUE 1: the License Repository Feature
>> =======================================
>>
>> The original idea that came out of the last Buildroot Developer Day was to
>> maintain in BR a "license repository" holding those licenses that are used
>> without change by many projects, such as the GPL family.
>> Packages that cannot use this mechanism would need to explicitly define the
>> license file in<PKG>_LICENSE_FILES.
>>
>> The idea of implementation was:
>>   if (<PKG>_LICENSE_FILES defined):
>>     copy $(<PKG>_LICENSE_FILES)
>>   else if (<PKG>_LICENSE = *GPL*, or any other known that's always equal):
>>     copy file from a "license repo dir" (one copy only per file);
>>   else:
>>     copy nothing and warn user
>>
>> Unfortunately, as Will Moore also pointed out, I discovered that the same
>> license (e.g. GPLv2) is not always identical between two packages, although
>> the differences might be not substantial.
>>
>> I do not have precise figures, but the number of variations might be quite
>> large. In a config with ~25 packages enabled I got this:
>>   $ make external-deps|wc -l
>>   39
>>   $ find . -iname "COPYING*" -o -iname "LICENSE*" | \
>>     xargs grep -l 'Version 2,' | xargs md5sum | \
>>     awk '{print $1}'|sort|uniq|wc -l
>>   20
>>
>> These are 20 different GPLv2 files! Some only have whitespace changes, some
>> have other little differences. An example:
>>
>>   $ diff -u0 -b  ./binutils-2.21.1/COPYING ./libtool-2.2.10/COPYING
>>   --- ./binutils-2.21.1/COPYING 2005-07-14 03:24:56.000000000 +0200
>>   +++ ./libtool-2.2.10/COPYING  2010-05-20 23:18:41.000000000 +0200
>>    @@ -4 +4 @@
>>    - Copyright (C) 1989, 1991 Free Software Foundation, Inc.
>>    + Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
>>
>> An added comma.
>>
>>    @@ -18 +18 @@
>>    -the GNU Library General Public License instead.)  You can apply it to
>>    +the GNU Lesser General Public License instead.)  You can apply it to
>>
>> This updates a reference to another license.
>>
>>   @@ -306,4 +306,3 @@
>>   -    You should have received a copy of the GNU General Public License
>>   -    along with this program; if not, write to the Free Software
>>   -    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
>>   -
>>   +    You should have received a copy of the GNU General Public License along
>>   +    with this program; if not, write to the Free Software Foundation, Inc.,
>>   +    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>>
>> Just formatting changes here.
>>
>>   @@ -339 +338 @@
>>   -library.  If this is what you want to do, use the GNU Library General
>>   +library.  If this is what you want to do, use the GNU Lesser General
>>
>> Same as above.
>>
>> Another example:
>>
>>   $ diff -u0 -b  ./binutils-2.21.1/COPYING  ./iostat-2.2/LICENSE
>>   --- ./binutils-2.21.1/COPYING 2005-07-14 03:24:56.000000000 +0200
>>   +++ ./iostat-2.2/LICENSE      2004-11-25 11:53:11.000000000 +0100
>>   @@ -5 +5 @@
>>   -     51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
>>   +     59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
>>
>> Apparently the FSF offices have moved some time in the past.
>>
>>   @@ -308 +308 @@
>>   -    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
>>   +    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
>>
>> Same as above.
>>
>> I did not investigate a lot to discover if there are more substantial
>> differences. I wanted to stay on the safe side, so I just did not implement the
>> "license repository" and the second step of the algorithm. All packages that
>> want their license files copied must define<PKG>_LICENSE_FILES. Full stop.
>>
>> The license repository feature may still be added in the future, but I think
>> it should be discussed before. Asking the FSF may be an option, I guess they
>> listen to an active community developing free software.
> For me treating each license as a different one is OK. As you say,
> it's for sure the safest option. It will keep the logic in buildroot
> simple.
>
>>
>> ISSUE 2: Packages with multiple licenses
>> ========================================
>>
>> Some packages (e.g. freetype, qt) allow to choose among different licenses.
>> - Should we add an option in menuconfig for choosing the license? This would
>>   allow to generate "customized" manifest and license files.
>> - Or should we save all licenses and and define the package license as, for
>>   instance:
>>     QT_LICENSE = GPLv3 or LGPLv2.1 or COMMERCIAL?
>>
>> I think the first option is more nice and still legally correct, so I
>> implemented it for Qt to see how it would look. You can see the implementation
>> in a patch near the bottom of this set. It's not currently documented at all,
>> I'd first like to know if the approach is good or option 2 (or whatever else)
>> is better.
> In any case, a commercial license cannot be used without having a
> legal agreement with the package author. Since this is a rare case, I
> don't think we should try to handle this in buildroot. I'd let the
> user handle this case.

Yes, I wrote commercial there just for example, I don't think it's
so necessary.

> Personally, I don't think that many people will be careful in
> selecting the appropriate license from the config system. We'd need a
> default, and the question becomes what's the default? Some people will
> prefer v3 and others v2.
> I'd keep it up to the user to fix the csv and related files to reflect
> their choice. We can already copy all licenses as you suggest, but I
> don't know whether a user should remove the non-appropriate files or
> not to be legally ok...

Not sure I agree here. Having a menuconfig knob makes the
user conscious about his right to choose, as well as his "need"
to choose.
Say I release a product using Qt and I distribute it with both
license files, GPLv3 and LGPLv2. Since I also distribute it under
GPLv3 too, can a customer ask me to release the sources for
mt Qt-based proprietary application?
If I have proprietary applications, I would prefer to make things
clear in the beginning, and put only LGPL in my CD, printed
manual, About window, whatever.

[...]
> TODO in the next patchset before merging into mainline
> ======================================================
>
> - Add to the documentation:
>   - some words of advice from Buildroot developers about how to comply to GPL
>     and other open source licenses;
>   - brief instructions on using this stuff ('make legal-info');
>   - instructions in the GENTARGETS section about the _LICENSE and _LICENSE_FILES
>    constants.
>
> - Write a few lines of explanation in the log message of the first big commit,
>   the one that implements all the logic.
>
> - Save a defconfig instead of the whole .config for the Buildroot configuration?
>   Which one would you better like?
> A full .config is better I think, as it doesn't depend on the defaults
> in buildroot (e.g. version bump).

Nice to see there's a point everybody agrees on. :-)

Luca
