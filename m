From: Yann Sionneau <ysionneau@kalray.eu>
Date: Wed, 23 Oct 2019 14:06:07 +0200
Subject: [Buildroot] [PATCH] Do not remove path from RPATH when it is
 needed for dlopen at runtime
In-Reply-To: <1569933210-12665-1-git-send-email-ysionneau@kalray.eu>
References: <2b2ed104-854c-8d70-9b57-30bd6bd2fe1a@kalray.eu>
 <1569933210-12665-1-git-send-email-ysionneau@kalray.eu>
Message-ID: <744857e8-d23a-315c-4c04-abd586169a42@kalray.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping?

On 10/1/19 2:33 PM, Yann Sionneau wrote:
> Do not remove path from RPATH when it points to a directory containing no
> shared object present as DT_NEEDED in .dynamic section.
> The RPATH can pretty well be needed at runtime for dlopen.
>
> This fixes tst-origin uClibc-ng unit test:
> https://github.com/wbx-github/uclibc-ng-test/blob/master/test/dlopen/Makefile.in#L25
> https://github.com/wbx-github/uclibc-ng-test/blob/master/test/dlopen/tst-origin.c#L15
>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
>   ...ption-to-make-the-rpath-relative-under-a-specif.patch | 16 +++++-----------
>   1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch b/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
> index feec627..f9f2537 100644
> --- a/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
> +++ b/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
> @@ -167,7 +167,7 @@ index 1d9a772..35b4a33 100644
>        if (op == rpShrink && !rpath) {
>            debug("no RPATH to shrink\n");
>            return;
> -@@ -1120,26 +1196,86 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
> +@@ -1120,26 +1196,80 @@ void ElfFile<ElfFileParamNames>::modifyRPath(RPathOp op, string newRPath)
>                    continue;
>                }
>    
> @@ -250,12 +250,6 @@ index 1d9a772..35b4a33 100644
>   +                }
>   +            }
>   +
> -+            if (!libFoundInRPath(canonicalPath, neededLibs, neededLibFound)) {
> -+                debug("removing directory '%s' from RPATH because it does not contain needed libs\n",
> -+                      dirName.c_str());
> -+                continue;
> -+            }
> -+
>   +            /* Finally make "canonicalPath" relative to "filedir" in "rootDir" */
>   +            if (relativeToFile)
>   +                concatToRPath(newRPath, makePathRelative(canonicalPath, fileDir));
> @@ -268,7 +262,7 @@ index 1d9a772..35b4a33 100644
>        if (op == rpRemove) {
>            if (!rpath) {
>                debug("no RPATH to delete\n");
> -@@ -1413,7 +1549,9 @@ static bool shrinkRPath = false;
> +@@ -1413,7 +1543,9 @@ static bool shrinkRPath = false;
>    static bool removeRPath = false;
>    static bool setRPath = false;
>    static bool printRPath = false;
> @@ -278,7 +272,7 @@ index 1d9a772..35b4a33 100644
>    static set<string> neededLibsToRemove;
>    static map<string, string> neededLibsToReplace;
>    static set<string> neededLibsToAdd;
> -@@ -1438,14 +1576,16 @@ static void patchElf2(ElfFile & elfFile)
> +@@ -1438,14 +1570,16 @@ static void patchElf2(ElfFile & elfFile)
>            elfFile.setInterpreter(newInterpreter);
>    
>        if (printRPath)
> @@ -299,7 +293,7 @@ index 1d9a772..35b4a33 100644
>    
>        if (printNeeded) elfFile.printNeededLibs();
>    
> -@@ -1508,6 +1648,9 @@ void showHelp(const string & progName)
> +@@ -1508,6 +1642,9 @@ void showHelp(const string & progName)
>      [--set-rpath RPATH]\n\
>      [--remove-rpath]\n\
>      [--shrink-rpath]\n\
> @@ -309,7 +303,7 @@ index 1d9a772..35b4a33 100644
>      [--print-rpath]\n\
>      [--force-rpath]\n\
>      [--add-needed LIBRARY]\n\
> -@@ -1564,6 +1707,17 @@ int main(int argc, char * * argv)
> +@@ -1564,6 +1701,17 @@ int main(int argc, char * * argv)
>                setRPath = true;
>                newRPath = argv[i];
>            }
