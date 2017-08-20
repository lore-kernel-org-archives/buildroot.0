From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 20 Aug 2017 16:01:05 +0200
Subject: [Buildroot] [PATCH] norm: fix build with gcc 7.x
In-Reply-To: <20170820135234.16037-1-thomas.petazzoni@free-electrons.com>
References: <20170820135234.16037-1-thomas.petazzoni@free-electrons.com>
Message-ID: <54b0c204-110e-a059-1b91-baed016e5f34@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 20/08/2017 ? 15:52, Thomas Petazzoni a ?crit :
> This commit adds a patch to the norm package that fixes the build with
> gcc 7.x. Many thanks to Romain Naour for pointing out the solution to
> this C++ build problem.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/c79dc84cdc34d62199099eb4438b1aed3e7459bb/

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/norm/0003-fix-const-qualifier-gcc7.patch | 44 ++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/norm/0003-fix-const-qualifier-gcc7.patch
> 
> diff --git a/package/norm/0003-fix-const-qualifier-gcc7.patch b/package/norm/0003-fix-const-qualifier-gcc7.patch
> new file mode 100644
> index 0000000..3d9671f
> --- /dev/null
> +++ b/package/norm/0003-fix-const-qualifier-gcc7.patch
> @@ -0,0 +1,44 @@
> +protolib: remove const qualifiers in ProtoSortedTreeTemplate
> +
> +The methods PeekPrevItem() and PeekNextItem() in
> +ProtoSortedTreeTemplate were using a const qualifier, but not the
> +corresponding methods in ProtoSortedTree, causing a build failure with
> +gcc 7.x:
> +
> +norm-1.5r6/protolib/include/protoTree.h: In member function 'ITEM_TYPE* ProtoSortedTreeTemplate<ITEM_TYPE>::Iterator::PeekPrevItem() const':
> +norm-1.5r6/protolib/include/protoTree.h:652:93: error: no matching function for call to 'ProtoSortedTreeTemplate<ITEM_TYPE>::Iterator::PeekPrevItem() const'
> +                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::PeekPrevItem());}
> +                                                                                             ^
> +norm-1.5r6/protolib/include/protoTree.h:565:23: note: candidate: ProtoSortedTree::Item* ProtoSortedTree::Iterator::PeekPrevItem() <near match>
> +                 Item* PeekPrevItem()
> +                       ^~~~~~~~~~~~
> +
> +Since the same methods in ProtoTreeTemplate don't have the const
> +qualifier, we take the simple solution of dropping such qualifiers
> +from ProtoSortedTreeTemplate as well, which fixes the build of norm
> +with gcc 7.x.
> +
> +Many thanks to Romain Naour <romain.naour@gmail.com> for pointing out
> +the solution.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +
> +Index: b/protolib/include/protoTree.h
> +===================================================================
> +--- a/protolib/include/protoTree.h
> ++++ b/protolib/include/protoTree.h
> +@@ -648,12 +648,12 @@
> +                 
> +                 ITEM_TYPE* GetPrevItem()
> +                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::GetPrevItem());}
> +-                ITEM_TYPE* PeekPrevItem() const
> ++                ITEM_TYPE* PeekPrevItem()
> +                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::PeekPrevItem());}
> +                 
> +                 ITEM_TYPE* GetNextItem()
> +                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::GetNextItem());}
> +-                ITEM_TYPE* PeekNextItem() const
> ++                ITEM_TYPE* PeekNextItem()
> +                     {return static_cast<ITEM_TYPE*>(ProtoSortedTree::Iterator::PeekNextItem());}
> + 
> +         };  // end class ProtoSortedTreeTemplate::Iterator
> 
