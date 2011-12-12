From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 12 Dec 2011 14:06:53 +0200
Subject: [Buildroot] connman dowload failure
Message-ID: <20111212120653.GF4531@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

I'm trying to build connman for my platform, but the build fails at the source 
download stage using both git and wget. This is the output of 'make V=1':

>>> connman 0.78 Downloading
if test -n "" ; then case "" in scp)    test -e /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz || scp  /connman-0.78.tar.gz /home/baruch/git/buildroot/output/dl && exit ;; *)    test -e /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz || wget --passive-ftp -nd  -P /home/baruch/git/buildroot/output/dl /connman-0.78.tar.gz && exit ;; esac ; fi ; if test -n "git://git.kernel.org/pub/scm/network/connman/connman.git" ; then case "git" in git)     test -e /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz || (pushd /home/baruch/git/buildroot/output/dl > /dev/null && git clone clone --bare git://git.kernel.org/pub/scm/network/connman/connman.git connman-0.78 && pushd connman-0.78 > /dev/null && git clone archive --format=tar --prefix=connman-0.78/ 0.78 | gzip -c > /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz && popd > /dev/null && rm -rf /home/baruch/git/buildroot/output/dl/connman-0.78 && popd > /dev/null) && exit ;; svn)   test -e /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz || (pushd /home/baruch/git/buildroot/output/dl > /dev/null && svn export -r 0.78 git://git.kernel.org/pub/scm/network/connman/connman.git /home/baruch/git/buildroot/output/dl/connman-0.78 && tar czf connman-0.78.tar.gz connman-0.78/ && rm -rf /home/baruch/git/buildroot/output/dl/connman-0.78 && popd > /dev/null) && exit ;; bzr)  test -e /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz || bzr export /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz git://git.kernel.org/pub/scm/network/connman/connman.git -r 0.78 && exit ;; file)   test -e /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz || cp git://git.kernel.org/pub/scm/network/connman/connman.git/connman-0.78.tar.gz /home/baruch/git/buildroot/output/dl && exit ;; scp)    test -e /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz || scp  git.kernel.org/pub/scm/network/connman/connman.git/connman-0.78.tar.gz /home/baruch/git/buildroot/output/dl && exit ;; hg)     test -e /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz || (pushd /home/baruch/git/buildroot/output/dl > /dev/null && hg  clone --noupdate --rev 0.78 git://git.kernel.org/pub/scm/network/connman/connman.git connman-0.78 && hg  archive --repository connman-0.78 --type tgz --prefix connman-0.78/ --rev 0.78 /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz && rm -rf /home/baruch/git/buildroot/output/dl/connman-0.78 && popd > /dev/null) && exit ;; *)  test -e /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz || wget --passive-ftp -nd  -P /home/baruch/git/buildroot/output/dl git://git.kernel.org/pub/scm/network/connman/connman.git/connman-0.78.tar.gz && exit ;; esac ; fi ; if test -n "http://buildroot.net/downloads/sources/" ; then     test -e /home/baruch/git/buildroot/output/dl/connman-0.78.tar.gz || wget --passive-ftp -nd  -P /home/baruch/git/buildroot/output/dl http://buildroot.net/downloads/sources//connman-0.78.tar.gz && exit ; fi ; exit 1
Too many arguments.

usage: git clone [options] [--] <repo> [<dir>]

    -v, --verbose         be more verbose
    -q, --quiet           be more quiet
    --progress            force progress reporting
    -n, --no-checkout     don't create a checkout
    --bare                create a bare repository
    --mirror              create a mirror repository (implies bare)
    -l, --local           to clone from a local repository
    --no-hardlinks        don't use local hardlinks, always copy
    -s, --shared          setup as shared repository
    --recursive           initialize submodules in the clone
    --recurse-submodules  initialize submodules in the clone
    --template <template-directory>
                          directory from which templates will be used
    --reference <repo>    reference repository
    -o, --origin <branch>
                          use <branch> instead of 'origin' to track upstream
    -b, --branch <branch>
                          checkout <branch> instead of the remote's HEAD
    -u, --upload-pack <path>
                          path to git-upload-pack on the remote
    --depth <depth>       create a shallow clone of that depth
    --separate-git-dir <gitdir>
                          separate git dir from working tree
    -c, --config <key=value>
                          set config inside the new repository

--2011-12-12 14:01:25--  http://buildroot.net/downloads/sources//connman-0.78.tar.gz
Resolving buildroot.net (buildroot.net)... 140.211.167.224
Connecting to buildroot.net (buildroot.net)|140.211.167.224|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://sources.buildroot.net//connman-0.78.tar.gz [following]
--2011-12-12 14:01:30--  http://sources.buildroot.net//connman-0.78.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2011-12-12 14:01:30 ERROR 404: Not Found.

make: *** [/home/baruch/git/buildroot/output/build/connman-0.78/.stamp_downloaded] Error 1

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
