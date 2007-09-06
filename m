From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 6 Sep 2007 08:54:22 -0700
Subject: [Buildroot] [buildroot 0001491]: QTopia4 and uclibc string.h macro
	"index()" conflict
Message-ID: <b1a21b40d8175f4a928486c1c90ca0ce@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1491 
====================================================================== 
Reported By:                HappyCactus
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1491
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-06-2007 08:54 PDT
Last Modified:              09-06-2007 08:54 PDT
====================================================================== 
Summary:                    QTopia4 and uclibc string.h macro "index()" conflict
Description: 
QTopia4 4.3.1 and uclibc doesn't compile when
__UCLIBC_SUSV3_LEGACY_MACROS__ is defined in uclibc.
Infacts we see in $(STAGING_DIR)/usr/include/string.h:

#  ifdef __UCLIBC_SUSV3_LEGACY_MACROS__
/* bcopy/bzero/bcmp/index/rindex are marked LEGACY in SuSv3.
 * They are replaced as proposed by SuSv3. Don't sync this part
 * with glibc and keep it in sync with strings.h.  */

#  define bcopy(src,dest,n) (memmove((dest), (src), (n)), (void) 0)
#  define bzero(s,n) (memset((s), '\0', (n)), (void) 0)
#  define bcmp(s1,s2,n) memcmp((s1), (s2), (size_t)(n))
#  define index(s,c) strchr((s), (c))
#  define rindex(s,c) strrchr((s), (c))
#  endif
#

Not very smart to define a macro for this very common names. Imagine what
happens if src/corelib/kernel/qabstractitemmodel.h contains his code:

class Q_CORE_EXPORT QAbstractItemModel : public QObject
{
// ...
    virtual QModelIndex index(int row, int column,
           const QModelIndex &parent = QModelIndex()) const = 0;
 
Of course, the preprocessor changes the index to strchr( ... and doesn't
compile.
A workaround is a patch for the QByteArray.h file that unsets the macro.
But it should be better to change the #define index(r,s) with a simple
call to the chrchr () function and let the compiler do his optimizations.


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-06-07 08:54  HappyCactus    New Issue                                    
09-06-07 08:54  HappyCactus    Status                   new => assigned     
09-06-07 08:54  HappyCactus    Assigned To               => buildroot       
======================================================================
