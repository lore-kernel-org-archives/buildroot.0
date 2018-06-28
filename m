From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Jun 2018 19:15:41 +0000
Subject: [Buildroot] [Bug 11121] New: statfs call corrupts memory struct
 statfs too small
Message-ID: <bug-11121-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11121

            Bug ID: 11121
           Summary: statfs call corrupts memory struct statfs too small
           Product: buildroot
           Version: unspecified
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: geoff at infradead.org
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7656
  --> https://bugs.busybox.net/attachment.cgi?id=7656&action=edit
statfs test program

It seems there is a mismatch between the struct statfs used by libc and that
used by the arm64 kernel.  The call to statfs() writes 120 bytes, but struct
statfs is only 88 bytes.  The attached test program shows this.

I experienced seg faults due to stack corruption when calling statfs() with an
automatic struct statfs variable.

Building for arm64.
libuClibc-1.0.30

Using master at revision 751df64eb344eee6a583755de09d3d506ac2fe33.

The output of statfs-test program:

sizeof statfs: 88
sizeof packed: 138
  1: 94 94
  2: 19 19
  3: 2  2
  4: 1  1
  5: 0  0
  6: 0  0
  7: 0  0
  8: 0  0
  9: 0  0
 10: 10 10
 11: 0  0
 12: 0  0
 13: 0  0
 14: 0  0
 15: 0  0
 16: 0  0
 17: 72 72
 18: a5 a5
 19: 7  7
 20: 0  0
 21: 0  0
 22: 0  0
 23: 0  0
 24: 0  0
 25: 83 83
 26: 80 80
 27: 7  7
 28: 0  0
 29: 0  0
 30: 0  0
 31: 0  0
 32: 0  0
 33: 83 83
 34: 80 80
 35: 7  7
 36: 0  0
 37: 0  0
 38: 0  0
 39: 0  0
 40: 0  0
 41: 72 72
 42: a5 a5
 43: 7  7
 44: 0  0
 45: 0  0
 46: 0  0
 47: 0  0
 48: 0  0
 49: d9 d9
 50: a0 a0
 51: 7  7
 52: 0  0
 53: 0  0
 54: 0  0
 55: 0  0
 56: 0  0
 57: 0  0
 58: 0  0
 59: 0  0
 60: 0  0
 61: 0  0
 62: 0  0
 63: 0  0
 64: 0  0
 65: ff ff
 66: 0  0
 67: 0  0
 68: 0  0
 69: 0  0
 70: 0  0
 71: 0  0
 72: 0  0
 73: 0  0
 74: 10 10
 75: 0  0
 76: 0  0
 77: 0  0
 78: 0  0
 79: 0  0
 80: 0  0
 81: 20 20
 82: 0  0
 83: 0  0
 84: 0  0
 85: 0  0
 86: 0  0
 87: 0  0
 88: 0  0
 89: 0  0
 90: 0  0
 91: 0  0
 92: 0  0
 93: 0  0
 94: 0  0
 95: 0  0
 96: 0  0
 97: 0  0
 98: 0  0
 99: 0  0
100: 0  0
101: 0  0
102: 0  0
103: 0  0
104: 0  0
105: 0  0
106: 0  0
107: 0  0
108: 0  0
109: 0  0
110: 0  0
111: 0  0
112: 0  0
113: 0  0
114: 0  0
115: 0  0
116: 0  0
117: 0  0
118: 0  0
119: 0  0
120: 0  0
121: ff cc
122: ff cc
123: ff cc
124: ff cc
125: ff cc
126: ff cc
127: ff cc
128: ff cc
129: ff cc
130: ff cc
131: ff cc
132: ff cc
133: ff cc
134: ff cc
135: ff cc
136: ff cc
137: ff cc
138: ff cc

-- 
You are receiving this mail because:
You are on the CC list for the bug.
