From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Aug 2020 18:16:59 +0200
Subject: [Buildroot] [git commit] package/patchelf: keep RPATH entries
 even without DT_NEEDED libraries
In-Reply-To: <20200825110428.40F71815AF@busybox.osuosl.org>
References: <20200825110428.40F71815AF@busybox.osuosl.org>
Message-ID: <20200825161659.GE2246@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thomas, All,

On 2020-08-25 13:11 +0200, Thomas Petazzoni spake thusly:
> commit: https://git.buildroot.net/buildroot/commit/?id=bcdb74512d9f6e7eca878c53aca2eb3eccac7ef3
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Our patch
> 0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch adds
> an option --make-rpath-relative, which we use to tweak RPATH of target
> binaries.
> 
> However, one of the effect of this option is that it drops RPATH
> entries if the corresponding directory does not contain a library that
> is referenced by a DT_NEEDED entry of the binary.
> 
> This unfortunately isn't correct, as RPATH entries are not only used
> by the dynamic linker to resolve the location of libraries listed
> through DT_NEEDED entries: RPATH entries are also used by dlopen()
> when resolving the location of libraries that are loaded at runtime.
[--SNIP--]
> @@ -250,12 +250,6 @@ index 1d9a772..35b4a33 100644
>  +                }
>  +            }
>  +
> -+            if (!libFoundInRPath(canonicalPath, neededLibs, neededLibFound)) {
> -+                debug("removing directory '%s' from RPATH because it does not contain needed libs\n",
> -+                      dirName.c_str());
> -+                continue;

I'd rather that we keep that as a warning, because in some cases it
really is an error to keep an RPATH with no DT_NEEDED.

    debug("keeping directory %s in RPATH, even though it contains no needed library\n", dirName.c_str())

Bonus points if it would be driven by a --option on the command line. ;-)

Regards,
Yann E. MORIN.

> -+            }
> -+
>  +            /* Finally make "canonicalPath" relative to "filedir" in "rootDir" */
>  +            if (relativeToFile)
>  +                concatToRPath(newRPath, makePathRelative(canonicalPath, fileDir));
> @@ -268,7 +262,7 @@ index 1d9a772..35b4a33 100644
>       if (op == rpRemove) {
>           if (!rpath) {
>               debug("no RPATH to delete\n");
> -@@ -1413,7 +1549,9 @@ static bool shrinkRPath = false;
> +@@ -1413,7 +1543,9 @@ static bool shrinkRPath = false;
>   static bool removeRPath = false;
>   static bool setRPath = false;
>   static bool printRPath = false;
> @@ -278,7 +272,7 @@ index 1d9a772..35b4a33 100644
>   static set<string> neededLibsToRemove;
>   static map<string, string> neededLibsToReplace;
>   static set<string> neededLibsToAdd;
> -@@ -1438,14 +1576,16 @@ static void patchElf2(ElfFile & elfFile)
> +@@ -1438,14 +1570,16 @@ static void patchElf2(ElfFile & elfFile)
>           elfFile.setInterpreter(newInterpreter);
>   
>       if (printRPath)
> @@ -299,7 +293,7 @@ index 1d9a772..35b4a33 100644
>   
>       if (printNeeded) elfFile.printNeededLibs();
>   
> -@@ -1508,6 +1648,9 @@ void showHelp(const string & progName)
> +@@ -1508,6 +1642,9 @@ void showHelp(const string & progName)
>     [--set-rpath RPATH]\n\
>     [--remove-rpath]\n\
>     [--shrink-rpath]\n\
> @@ -309,7 +303,7 @@ index 1d9a772..35b4a33 100644
>     [--print-rpath]\n\
>     [--force-rpath]\n\
>     [--add-needed LIBRARY]\n\
> -@@ -1564,6 +1707,17 @@ int main(int argc, char * * argv)
> +@@ -1564,6 +1701,17 @@ int main(int argc, char * * argv)
>               setRPath = true;
>               newRPath = argv[i];
>           }
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
